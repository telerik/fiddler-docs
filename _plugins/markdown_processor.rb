module Jekyll
    require 'kramdown'

    class Kramdown::Converter::CustomHtml < Kramdown::Converter::Html
      def initialize(root, options)
          super

          @baseurl = options[:baseurl]
      end

      # https://github.com/gettalong/kramdown/blob/master/lib/kramdown/converter/html.rb#L135
      def convert_header(el, indent)
          attr = el.attr.dup

          level = output_header_level(el.options[:level])

          if level <= 3 && @options[:auto_ids] && !attr['id']
              attr['id'] = generate_id(el.options[:raw_text])
          end

          # detect API reference to allow customized ID generation
          if level == 2 && attr['id'] =~ /configuration|events|properties|methods|fields/
              @prefix = attr['id']
          end

          # customized ID generation compatible with the existing one
          if level == 3 && @prefix
              attr['id'] = generate_prefix_id(el.options[:raw_text])
          end

          @toc << [el.options[:level], attr['id'], el.children] if attr['id'] && in_toc?(el)

          # wrap the header in a link to allow clicking
          if level <= 3
              a = Kramdown::Element.new(:a, nil, {'href' => "##{attr['id']}"})
              a.children = el.children
              el.children = [a]
          end

          format_as_block_html("h#{level}", attr, inner(el, indent), indent)
      end

      def convert_img(el, indent)
          root_url(el, 'src')
          super
      end

      def convert_a(el, indent)
          root_url(el, 'href')
          super
      end

      def root_url(el, name)
          el.attr[name] = @baseurl + el.attr[name] if el.attr[name].start_with?('/')
      end

      def generate_prefix_id(str)
          gen_id = str.gsub(/`[^`]*`/, '')
          gen_id.gsub!(/\\/,'')
          gen_id.gsub!(/\*[^*]*\*/, '')
          gen_id.strip!
          "#{@prefix}-#{gen_id}"
      end
    end

    require 'github/markup'
    require 'html/pipeline'

    class RootRelativeFilter < HTML::Pipeline::Filter

        def call
            doc.search('a').each do |a|
                next if a['href'].nil?

                href = a['href'].strip

                if href.start_with? '/'
                    a['href'] = context[:baseurl] +  href
                end
            end

            doc.search('img').each do |img|
                next if img['src'].nil?
                src = img['src'].strip
                if src.start_with? '/'
                    img['src'] = context[:baseurl] + src
                end
            end

            doc
        end

    end

    # based on https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/toc_filter.rb
    class HeaderLinkFilter < HTML::Pipeline::Filter

        PUNCTUATION_REGEXP = RUBY_VERSION > "1.9" ? /[^\p{Word}\- ]/u : /[^\w\- ]/

        def call

            doc.css('h1, h2, h3').each do |node|
                next if node['id']

                id = node.text.downcase
                id.gsub!(PUNCTUATION_REGEXP, '') # remove punctuation
                id.gsub!(' ', '-') # replace spaces with dash

                node['id'] = id

                a = Nokogiri::XML::Node.new 'a', doc
                a['href'] = "##{id}"
                a.children = node.children
                node.add_child a
            end

            doc
        end
    end

    class Converters::Markdown::MarkdownProcessor
        def initialize(config)
            @config = config

            context = {
                :baseurl => @config['baseurl']
            }

            @pipeline = HTML::Pipeline.new [
                HTML::Pipeline::MarkdownFilter,
                RootRelativeFilter,
                HeaderLinkFilter
            ], context

        end

        def convert(content)
            @pipeline.call(content)[:output].to_s
        end
    end

end
