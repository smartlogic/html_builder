require "html/text"

module HTML
  class Tag
    def initialize(tag, content, attrs = {})
      @tag = tag
      @content = content
      @attrs = attrs
    end

    def to_html
      "#{start_tag}#{content}#{end_tag}"
    end

    private

    def attrs
      @attrs.map { |attr, value| " #{attr}=\"#{value}\"" }.join
    end

    def content
      HTML::Text.new(@content).to_html
    end

    def start_tag
      "<#{@tag}#{attrs}>"
    end

    def end_tag
      "</#{@tag}>"
    end
  end
end
