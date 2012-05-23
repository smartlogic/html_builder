require "html"
require "html/tag"
require "html/list"
require "html/map"

module HTML
  class Table < Struct.new(:data)
    def to_html
      HTML.build(data) do |data|
        tag(:table, thead(data) + tbody(data))
      end
    end
  end

  class Thead < Struct.new(:data)
    def to_html
      return "" unless data.respond_to?(:columns)
      HTML.build(data.columns) do |cols|
        tag(:thead, tr(cols))
      end
    end
  end

  class Tbody < Struct.new(:data)
    def to_html
      return "" unless data.respond_to?(:rows)
      HTML.build(data.rows) do |rows|
        tag(:tbody, map(:tr, rows))
      end
    end
  end

  class Tr < Struct.new(:columns)
    def to_html
      HTML.build(columns) do |cols|
        tag(:tr, list(:td, cols))
      end
    end
  end
end
