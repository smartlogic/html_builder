require "html/builder"
require "html/tag"

module HTML
  class Sequence
    def initialize(tag, enum)
      @tag = tag
      @enum = enum
    end

    def to_html
      Builder.build do |html|
        @enum.map { |item| html.tag @tag, item }.join
      end
    end
  end
end
