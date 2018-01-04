require 'jekyll-sitemap'

module Jekyll
    class SitemapGenerator < JekyllSitemap
      
        def sitemap_content
            site_map = Page.new(@site, File.dirname(__FILE__), '', 'sitemap.xml')
            site_map.content = File.read(source_path)
            site_map.render(Hash.new, @site.site_payload)
            site_map.output
        end
    end
end
