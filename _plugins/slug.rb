class SlugTag < Liquid::Block
    def initialize(tag_name, text, tokens)
        @text = text.strip
    end

    def render(context)
        site = context.registers[:site]
        page = site.pages.find {|p| p.data['slug'] == @text }
        page.url.sub('.html', '')
    end
end

Liquid::Template.register_tag('slug', SlugTag)
