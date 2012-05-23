require "html/builder"
require "html/tag"

module HTML
  class List
    def initialize(enum)
      @enum = enum
    end

    def to_html
      Builder.build(@enum) do |enum|
        tag(:ul, enum.map { |item| tag(:li, item) })
      end
    end
  end
end
