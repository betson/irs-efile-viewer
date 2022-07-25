# Prep Stylesheets
#
# This script is designed to be idempotent. It can be run from any directory
# within the project, and it automatically cleans up all files within /mef
# based on known rules. It is executed at the end of `import_taxyear.rb`,
# but it can be run independently if needed.
def prep_stylesheets
    root_directory = File.expand_path("..", __dir__)
    mef_directory = File.expand_path("mef", root_directory)
    Dir.chdir(mef_directory) do

        # Find and update all files that have relative URLs to other assets
        # Dependency: ack
        files_with_relative_urls = `ack -l "(?<!}})/mef/"`.split(/\n/)
        for filename in files_with_relative_urls
            contents = File.read(filename)

            # replace relative URLs with compatible version for Github Pages
            contents.gsub!(/(?<!}})\/mef\//, "{{ site.github.url }}/mef/")

            # add Jekyll front matter
            if contents !~ /\A---\n---\n/
                contents = contents.prepend("---\n---\n")
            end

            File.open(filename, "w") { |file| file << contents }
        end

        # Find and update all files that still reference /rrdprd
        # Dependency: ack
        files_with_relative_urls = `ack -l -i "mef/rrdprd/"`.split(/\n/)
        for filename in files_with_relative_urls
            contents = File.read(filename)
            contents.gsub!(/mef\/rrdprd\//i, "mef/rrprd/")
            File.open(filename, "w") { |file| file << contents }
        end
    end

    puts %{
All imported files have been prepped:
  - All relative URLs have been replaced to work with Jekyll
  - All legacy references to "/rrdprd" have been replaced

}
end
