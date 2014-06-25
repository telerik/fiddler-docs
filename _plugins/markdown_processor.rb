module Jekyll

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

    class ApiHeaderIdFilter < HTML::Pipeline::Filter

        def call

            doc.css('h2').each do |node|
                text = node.text

                next unless text =~ /^Configuration|Events|Properties|Methods|Class Methods|Fields$/

                prefix = text.downcase.gsub(' ', '-')

                node = node.next_element

                until node.nil?
                    break if node.name == 'h2'

                    if node.name == 'h3'
                        id = node.text
                        id.gsub!(/ .*/, '')
                        id.gsub!(/`[^`]*`/, '')
                        id.gsub!(/\\/,'')
                        id.gsub!(/\*[^*]*\*/, '')
                        node['id'] = "#{prefix}-#{id}"
                    end

                    node = node.next_element
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

                id = node['id']

                unless id
                    id = node.text.downcase
                    id.gsub!(PUNCTUATION_REGEXP, '') # remove punctuation
                    id.gsub!(' ', '-') # replace spaces with dash
                end

                node['id'] = id

                a = Nokogiri::XML::Node.new('a', doc)
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
                ApiHeaderIdFilter,
                HeaderLinkFilter
            ], context

        end

        def convert(content)
            @pipeline.call(content)[:output].to_s
        end
    end

end
