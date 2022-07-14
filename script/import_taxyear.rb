require 'fileutils'
require 'shellwords'

source_directory = ARGV.first
root_directory = File.expand_path("..", __dir__)
target_directory = File.expand_path("mef", root_directory)

unless source_directory
    puts "Error: No source directory provided for IRS stylesheet archive"
    exit(false)
end

# TODO: confirm if it's safe to overwrite files (i.e., this is only for a tax year after what's been uploaded already)


Dir.chdir(source_directory) do
    # check the directory matches what's expected
    source_children = Dir.glob('*').select {|f| File.directory? f}
    if source_children.length != 1 && source_children.first != "mef"
        puts "Error: Directory #{source_directory} doesn't look like the root of an IRS stylesheet archive. Expecting \"mef/\" directory."
        exit(false)
    end

    # Prep the source archive so all files have `644` permissions. All files in our destination have
    # already been updated to match. This helps ensure the automated copy doesn't run into issues on
    # read-only files.
    `find #{source_directory} -type f -exec chmod 644 '{}' #{Shellwords.escape(";")}`

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
        FileUtils.cp("#{source_dir_prefix}/#{x}", File.expand_path("rrprd/common/images", target_directory), :preserve => true)
    end

    source_dir_prefix = "./mef/rrprd/sdi/versioned"
    target_dir_prefix = "rrprd/sdi/versioned"
    Dir.each_child(source_dir_prefix) do |year_directory|
        next if year_directory.start_with?(".")
        Dir.each_child("#{source_dir_prefix}/#{year_directory}") do |x|
            next if x.start_with?(".")
            types = ["images", "styles", "scripts"]
            
            # We might not have encountered a year yet. If it doesn't exist, create a destination at our target.
            unless File.directory?(File.expand_path("#{target_dir_prefix}/#{year_directory}", target_directory))
                new_directories = types.map { |t| File.expand_path("#{target_dir_prefix}/#{year_directory}/#{t}", target_directory)}
                FileUtils.mkdir_p(new_directories)
            end

            types.each do |type|
                Dir.each_child("#{source_dir_prefix}/#{year_directory}/#{type}") do |x|
                    next if x.start_with?(".")
                    FileUtils.cp("#{source_dir_prefix}/#{year_directory}/#{type}/#{x}", File.expand_path("#{target_dir_prefix}/#{year_directory}/#{type}", target_directory), :preserve => true)
                end
            end
            # TODO: This skips any additional files outside the standard three. Those haven't appeared since 2009.
        end
    end

    source_dir_prefix = "./mef/Stylesheets"
    target_dir_prefix = "Stylesheets"
    Dir.each_child(source_dir_prefix) do |year_directory|
        next if year_directory.start_with?(".")
        
        # We might not have encountered a year yet. If it doesn't exist, create a destination at our target.
        unless File.directory?(File.expand_path("#{target_dir_prefix}/#{year_directory}", target_directory))
            FileUtils.mkdir(File.expand_path("#{target_dir_prefix}/#{year_directory}", target_directory))
        end

        Dir.each_child("#{source_dir_prefix}/#{year_directory}") do |x|
            next if x.start_with?(".")
            FileUtils.cp("#{source_dir_prefix}/#{year_directory}/#{x}", File.expand_path("#{target_dir_prefix}/#{year_directory}", target_directory), :preserve => true)
        end
    end
end


# TODO: Call prep_stylesheets
