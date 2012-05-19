module HTML
  class Tag
    def initialize(tag, content)
      @tag = tag
      @content = content
    end

    def to_html
      "<#{@tag}>#{@content}</#{@tag}>"
    end
  end
end
