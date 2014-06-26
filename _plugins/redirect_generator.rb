module Jekyll
    class RedirectGenerator < Generator
        def generate(site)
            pages = site.pages.find_all { |p| p.data.has_key?('previous_url') }

            redirect_pages = pages.map do |page|
                previous_url = page.data['previous_url'].split(',')
                previous_url.map!{ |url| url.strip }

                { 'url' => page.url, 'previous_url' => previous_url.uniq }
            end

            site.config['redirect_pages'] = redirect_pages

            web_config = Page.new(site, site.source, '', 'web.config')
            web_config.content = File.read(File.join(site.source, 'web.config'))
            web_config.render(Hash.new, site.site_payload)
            File.write(File.join(site.dest, 'web.config'), web_config.output)

            site.static_files << web_config
        end

    end
end
