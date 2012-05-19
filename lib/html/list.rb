require "html/builder"
require "html/tag"
require "html/sequence"

module HTML
  class List
    def initialize(enum)
      @enum = enum
    end

    def to_html
      Builder.build do |html|
        html.tag(:ul, html.sequence(:li, @enum))
      end
    end
  end
end
