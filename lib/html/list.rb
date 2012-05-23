require "html/tag"

module HTML
  class List
    def initialize(tag, enum)
      @tag = tag
      @enum = enum
    end

    def to_html
      @enum.map { |item| Tag.new(@tag, item).to_html }.join
    end
  end
end
