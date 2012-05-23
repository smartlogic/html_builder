module HTML
  class Tag
    def initialize(tag, content)
      @tag = tag
      @content = content
    end

    def to_html
      content = [*@content].join
      "<#{@tag}>#{content}</#{@tag}>"
    end
  end
end
