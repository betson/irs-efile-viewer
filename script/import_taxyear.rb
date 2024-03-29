# Import Tax Year
#
# This is the main script to execute when importing a new tax year. This script
# takes a single argument for the IRS source directory to import. These resources
# are found at https://www.irs.gov/e-file-providers/modernized-e-file-mef-stylesheets.
# The IRS publishes a zip archive for the stylesheet assets for all forms for each
# tax year. To import a new tax year, first you would download and unpack the .zip.
# Then execute this script:
# $ script/import_taxyear.rb path/to/PY20XXRYY
#
# WARNING: The archive for each tax year contains files for multiple years. This
# represents fixes for those prior years that didn't appear in the original release.
# It's not clear why these fixes aren't localized to just the archive for a particular
# tax year - especially since each tax year gets updated releases as well.
#
# The result is that new tax years should be imported sequentially. ex: first 2019, then
# 2020, then 2021, etc. If Tax Year 2020 is re-imported after TY 2021 has already been
# imported, then you may potentially overwrite fixes that were only introduced within the
# 2021 archive.
#
# Additionally, it's common for there to be over 10 releases for a tax year. And to make
# things more challenging, the IRS will release updates to multiple tax years within a
# calendar year. For example right now:
#     TY 2022 - Release 01 - Last Updated 06-30-2022
#     TY 2021 - Release 11 - Last Updated 05-23-2022
#
# For this reason, I would wait to import a tax year until AFTER that tax year is over.
# That way you have a higher liklihood of importing the last release for the tax year,
# and you don't run into issues with the archives potentially overwriting importing files.
#
# Since there's a 1-2 year lag before the IRS publishes any 990 forms of a given tax year,
# this doesn't have a large functional impact. Though there's no problem with importing
# the latest tax year for personal use (ex: reviewing e-file documents that you generate
# yourself). You just need to take good notes on which release version you imported and
# what date you accessed the files from the IRS.
require 'fileutils'
require 'set'
require 'shellwords'
require_relative 'prep_stylesheets.rb'
require_relative 'stylesheet_fixes.rb'

FILE_EXTENSIONS = {"stylesheets" => ".xsl", "scripts" => ".js", "styles" => ".css"}
SOURCE_DIRECTORY = ARGV.first
ROOT_DIRECTORY = File.expand_path("..", __dir__)
TARGET_DIRECTORY = File.expand_path("mef", ROOT_DIRECTORY)

# Generate a log output line for a file based on the git commits of prior stylesheet fixes
def generate_history_line(file_name, commit_hashes, indent="")
    output = []
    return "No stylesheet fix listed for #{file_name}." unless commit_hashes

    Dir.chdir(ROOT_DIRECTORY) do
        commit_hashes.each do |hash|
            unless "commit" == `git cat-file -t #{hash}`.chomp
                output << indent + "#{file_name} (#{hash}): Error - No known git commit for hash '#{hash}'." 
                next
            end
            output << indent + "#{file_name} " + `git show --no-patch --format='(%h): %s' #{hash}`.chomp
        end
    end

    output.join("\n")
end

# Print log output for the history of stylesheet fixes for a given year. Alternatively
# narrow result to specific files across multiple years.
def render_stylesheet_history(year: nil, files: nil)
    output = []
    if year
        year_info = STYLESHEET_FIXES[year.to_sym]
        unless year_info
            puts "No stylesheet fixes for #{year}"
            return
        end

        output << year
        year_info.each_key do |year_file_type|
            output << "  " + year_file_type.to_s.capitalize()
            year_info[year_file_type].each do |file_name, commit_hashes|
                output << generate_history_line(file_name.to_s + "#{FILE_EXTENSIONS[year_file_type.to_s]}", commit_hashes, "    ")
            end
        end
    elsif files
        # input is an array of arrays:
        # [ ["2011", [{:type => "stylesheets", :filename => "CommonPathRef.xsl"}, {hash}]],
        #   ["2012", [{hash}, {hash}]]
        # ]
        files.each do |year_list|
            year = year_list[0]
            year_info = STYLESHEET_FIXES[year.to_sym]
            unless year_info
                puts "No stylesheet fixes for #{year}"
                next
            end

            output << year
            last_file_type = nil
            year_list[1].each do |file_entry|
                file_type = file_entry[:type]
                if file_type != last_file_type
                    last_file_type = file_type
                    output << "  " + file_type.capitalize()
                end

                filename_without_extension = file_entry[:filename].delete_suffix(".xsl").delete_suffix(".js").delete_suffix(".css")
                filename_with_extension = filename_without_extension + FILE_EXTENSIONS[file_type]
                output << generate_history_line(filename_with_extension, year_info[file_type.to_sym][filename_without_extension.to_sym], "    ")
            end
        end
    end

    puts output.join("\n")
end

#BEGIN main
new_taxyears = Set.new
modified_stylesheets = Hash.new { |hash, key| hash[key] = [] }

unless SOURCE_DIRECTORY
    puts "Error: No source directory provided for IRS stylesheet archive"
    exit(false)
end

# TODO: confirm if it's safe to overwrite files (i.e., this is only for a tax year after what's been uploaded already)


Dir.chdir(SOURCE_DIRECTORY) do
    # check the directory matches what's expected
    source_children = Dir.glob('*').select {|f| File.directory? f}
    if source_children.length != 1 && source_children.first != "mef"
        puts "Error: Directory #{SOURCE_DIRECTORY} doesn't look like the root of an IRS stylesheet archive. Expecting \"mef/\" directory."
        exit(false)
    end

    # Prep the source archive so all files have `644` permissions. All files in our destination have
    # already been updated to match. This helps ensure the automated copy doesn't run into issues on
    # read-only files.
    puts "Prepping source files..."
    `find #{SOURCE_DIRECTORY} -type f -exec chmod 644 '{}' #{Shellwords.escape(";")}`

    puts "Importing files from #{SOURCE_DIRECTORY}"

    # Move all files from Source -> Target
    # The source directory (IRS archive) lists any additions or alterations for a tax year. It needs to be
    # merged into our target directories. If we just replaced the target with the source, then we'd end up
    # removing any file that hadn't been updated. As a result, we iterate through each directory individually.
    #
    # We iterate through three sections:
    #   - rrprd/common -- Images shared by all stylesheets
    #   - rrprd/sdi    -- Resources used by a particular tax year's stylesheets
    #   - Stylesheets  -- Individual stylesheets (.xsl) for each form and schedule

    # A - rrprd/common
    source_dir_prefix = "./mef/rrprd/common/images"
    Dir.each_child(source_dir_prefix) do |x|
        next if x.start_with?(".")
        if Dir.exist?("#{source_dir_prefix}/#{x}")
            puts "  Skipping directory #{x}..."
            next
        end
        FileUtils.cp("#{source_dir_prefix}/#{x}", File.expand_path("rrprd/common/images", TARGET_DIRECTORY), :preserve => true)
    end
    puts "  Common images complete..."

    # B - rrprd/sdi
    source_dir_prefix = "./mef/rrprd/sdi/versioned"
    target_dir_prefix = "rrprd/sdi/versioned"
    types = ["images", "scripts", "styles"]
    Dir.each_child(source_dir_prefix) do |year_directory|
        next if year_directory.start_with?(".")
            
        # We might not have encountered a year yet. If it doesn't exist, create a destination at our target.
        unless File.directory?(File.expand_path("#{target_dir_prefix}/#{year_directory}", TARGET_DIRECTORY))
            new_taxyears << year_directory
            new_directories = types.map { |t| File.expand_path("#{target_dir_prefix}/#{year_directory}/#{t}", TARGET_DIRECTORY)}
            FileUtils.mkdir_p(new_directories)
        end

        types.each do |type|
            Dir.each_child("#{source_dir_prefix}/#{year_directory}/#{type}") do |x|
                next if x.start_with?(".")
                if Dir.exist?("#{source_dir_prefix}/#{year_directory}/#{type}/#{x}")
                    puts "  Skipping directory #{x}..."
                    next
                end
                unless type == "images"
                    previously_fixed = STYLESHEET_FIXES.dig(year_directory.to_sym, type.to_sym, x.delete_suffix(".css").delete_suffix(".js").to_sym)
                    modified_stylesheets[year_directory] << {:type => type, :filename => x} if previously_fixed
                end
                FileUtils.cp("#{source_dir_prefix}/#{year_directory}/#{type}/#{x}", File.expand_path("#{target_dir_prefix}/#{year_directory}/#{type}", TARGET_DIRECTORY), :preserve => true)
            end
            puts "  #{year_directory} #{type} complete..."
            # TODO: This skips any additional files outside the standard three. Those haven't appeared since 2009.
        end
    end

    # C - Stylesheets
    source_dir_prefix = "./mef/Stylesheets"
    target_dir_prefix = "Stylesheets"
    Dir.each_child(source_dir_prefix) do |year_directory|
        next if year_directory.start_with?(".")
        
        # We might not have encountered a year yet. If it doesn't exist, create a destination at our target.
        unless File.directory?(File.expand_path("#{target_dir_prefix}/#{year_directory}", TARGET_DIRECTORY))
            new_taxyears << year_directory
            FileUtils.mkdir(File.expand_path("#{target_dir_prefix}/#{year_directory}", TARGET_DIRECTORY))
        end

        Dir.each_child("#{source_dir_prefix}/#{year_directory}") do |x|
            next if x.start_with?(".")
            if Dir.exist?("#{source_dir_prefix}/#{year_directory}/#{x}")
                puts "  Skipping directory #{x}..."
                next
            end
            previously_fixed = STYLESHEET_FIXES.dig(year_directory.to_sym, :stylesheets, x.delete_suffix(".xsl").to_sym)
            modified_stylesheets[year_directory] << {:type => "stylesheets", :filename => x} if previously_fixed
            FileUtils.cp("#{source_dir_prefix}/#{year_directory}/#{x}", File.expand_path("#{target_dir_prefix}/#{year_directory}", TARGET_DIRECTORY), :preserve => true)
        end
        puts "  #{year_directory} stylesheets complete..."
    end
end

puts "\nImport Completed Successfully"

# Execute prep_stylesheets() to clean up imported files
puts "Prepping imported files...\n"
prep_stylesheets()

# Alert the user if we've replaced files that were previously modified to fix issues in the stylesheets
puts %{
     ====================================
    |   WARNING   --  FIX EACH OF THESE  |
     ====================================

    These files were replaced during the import. Each file was
    previously modified to fix an issue. Review each file and
    reapply the changes as necessary. Each filename is followed
    by a git commit hash and the description of the git commit
    that contained the stylesheet fix. 


} unless modified_stylesheets.empty?
render_stylesheet_history(files: modified_stylesheets.sort_by { |year, entry| year.to_i })

# Alert the user if a new year's information was added
new_taxyears.each do |new_taxyear|
    prior_taxyear = new_taxyear.to_i - 1
    puts %{
     =====================================
    |   ALERT   --  REVIEW EACH OF THESE  |
     =====================================

    This import added files for tax year #{new_taxyear}. Each
    previous year has required changes to a few files. Listed
    below are the files that were changed for tax year #{prior_taxyear}.
    Review each of these and see if their corresponding #{new_taxyear}
    files should be updated to match.


    }
    render_stylesheet_history(year: prior_taxyear.to_s)
end

puts "\n\n"
