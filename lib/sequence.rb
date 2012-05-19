require "html"
require "tag"

class Sequence
  def initialize(tag, enum)
    @tag = tag
    @enum = enum
  end

  def to_html
    HTML.build do |html|
      @enum.map { |item| html.tag @tag, item }.join
    end
  end
end
