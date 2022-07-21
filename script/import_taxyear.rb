require 'fileutils'
require 'set'
require 'shellwords'
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

# Print log output for the history of stylesheet fixes for a given year. Optionally
# narrow result to an individual file within a year.
def render_stylesheet_history(year, file=nil, file_type=nil)
    year_info = STYLESHEET_FIXES[year.to_sym]
    output = []
    unless year_info
        puts "No stylesheet fixes for #{year}" 
        return
    end

    if file
        unless ["stylesheets", "scripts", "styles"].include?(file_type)
            puts "Need to provide either \"stylesheets\", \"scripts\", or \"styles\" as a file type for #{file}."
            return
        end

        filename_without_extension = file.delete_suffix(".xsl").delete_suffix(".js").delete_suffix(".css")
        filename_with_extension = filename_without_extension + FILE_EXTENSIONS[file_type]
        output << generate_history_line(filename_with_extension, year_info[file_type.to_sym][filename_without_extension.to_sym])
    else
        output << year
        year_info.each_key do |year_file_type|
            output << "  " + year_file_type.to_s.capitalize()
            year_info[year_file_type].each do |file_name, commit_hashes|
                output << generate_history_line(file_name.to_s + "#{FILE_EXTENSIONS[year_file_type.to_s]}", commit_hashes, "    ")
            end
        end
    end

    puts output.join("\n")
end

#BEGIN main
new_taxyears = Set.new

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
    `find #{SOURCE_DIRECTORY} -type f -exec chmod 644 '{}' #{Shellwords.escape(";")}`

    # Move all files from Source -> Target
    # The source directory (IRS archive) lists any additions or alterations for a tax year. It needs to be
    # merged into our target directories. If we just replaced the target with the source, then we'd end up
    # removing any file that hadn't been updated. As a result, we iterate through each directory individually.
    #
    # We iterate through three sections:
    #   - rrprd/common -- Images shared by all stylesheets
    #   - rrprd/sdi    -- Resources used by a particular tax year's stylesheets
    #   - Stylesheets  -- Individual stylesheets (.xsl) for each form and schedule
    source_dir_prefix = "./mef/rrprd/common/images"
    Dir.each_child(source_dir_prefix) do |x|
        next if x.start_with?(".")
        FileUtils.cp("#{source_dir_prefix}/#{x}", File.expand_path("rrprd/common/images", TARGET_DIRECTORY), :preserve => true)
    end

    source_dir_prefix = "./mef/rrprd/sdi/versioned"
    target_dir_prefix = "rrprd/sdi/versioned"
    types = ["images", "styles", "scripts"]
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
                FileUtils.cp("#{source_dir_prefix}/#{year_directory}/#{type}/#{x}", File.expand_path("#{target_dir_prefix}/#{year_directory}/#{type}", TARGET_DIRECTORY), :preserve => true)
            end
            # TODO: This skips any additional files outside the standard three. Those haven't appeared since 2009.
        end
    end

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
            FileUtils.cp("#{source_dir_prefix}/#{year_directory}/#{x}", File.expand_path("#{target_dir_prefix}/#{year_directory}", TARGET_DIRECTORY), :preserve => true)
        end
    end
end


# Alert the user if a new year's information was added
new_taxyears.each do |new_taxyear|
    prior_taxyear = new_taxyear.to_i - 1
    puts "New tax year #{new_taxyear} was added. These files were previously updated for tax year #{prior_taxyear}. Matching files may need to be similarly updated as a new Stylesheet Fix for tax year #{new_taxyear}."
    render_stylesheet_history(prior_taxyear.to_s)
end

# TODO: Call prep_stylesheets
