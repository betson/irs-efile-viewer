root_directory = File.expand_path("..", __dir__)
mef_directory = File.expand_path("mef", root_directory)
Dir.chdir(mef_directory) do

    # update permissions of all files in a directory
    # chmod -R 755 mef/Stylesheets/2016

    # update each file in directory to have CRLF
    # find . -type f -name "*.xsl" -print0 | xargs -0 sed -i '' "s/\r*$/\r/"

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
end
