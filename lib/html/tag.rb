module HTML
  class Tag
    def initialize(tag, content)
      @tag = tag
      @content = content
    end

    def to_html
      content = [*@content].map(&:to_s).join
      "<#{@tag}>#{content}</#{@tag}>"
    end
  end
end
