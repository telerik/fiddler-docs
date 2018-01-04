module Jekyll
    class Page
        #https://github.com/jekyll/jekyll/blob/master/lib/jekyll/convertible.rb#L44
        def read_yaml(base, name, opts = {})
			filename = File.join(base, name)
			
            begin
                self.content = File.read(@path || site.in_source_dir(base, name),
                                         Utils.merged_file_read_opts(site, opts))
                if content =~ /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
                    self.content = $POSTMATCH
                    self.data = SafeYAML.load($1.gsub(/{{site\.([^}]+)}}/) {|o| site.config[$1]} )
                end
            rescue Psych::SyntaxError => e
				Jekyll.logger.warn "YAML Exception reading #{filename}: #{e.message}"
				raise e if self.site.config["strict_front_matter"]
			rescue StandardError => e
				Jekyll.logger.warn "Error reading file #{filename}: #{e.message}"
				raise e if self.site.config["strict_front_matter"]
			end

            self.data ||= {}
        end
    end
end
