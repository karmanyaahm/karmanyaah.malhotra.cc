module Jekyll
  module Tags
    class DetailsTag < Liquid::Block

      def initialize(tag_name, markup, tokens)
        super
        @caption = markup
      end

      def render(context)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        #converter = ::Jekyll::Converters::Markdown::KramdownParser.new({})
        caption = converter.convert(@caption).gsub(/<\/?p[^>]*>/, '').chomp
        body = converter.convert(super(context)).gsub("\n", "").chomp
        "<details markdown=block><summary markdown=span>#{caption}</summary>#{body}</details>"
      end

    end
  end
end

Liquid::Template.register_tag('details', Jekyll::Tags::DetailsTag)
