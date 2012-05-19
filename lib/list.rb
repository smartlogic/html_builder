require "html"
require "tag"
require "sequence"

class List
  def initialize(enum)
    @enum = enum
  end

  def to_html
    HTML.build do |html|
      html.tag(:ul, html.sequence(:li, @enum))
    end
  end
end
