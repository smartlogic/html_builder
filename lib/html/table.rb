require "html/list"
require "html/tag"
require "html/builder"

module HTML
  class Table < Struct.new(:data)
    def to_html
      Builder.build(data) do |data|
        tag(:table, thead(data) + tbody(data))
      end
    end
  end

  class Thead < Struct.new(:data)
    def to_html
      return "" unless data && data.respond_to?(:columns)
      Builder.build(data.columns) do |cols|
        tag(:thead, tr(cols))
      end
    end
  end

  class Tbody < Struct.new(:data)
    def to_html
      return "" unless data && data.respond_to?(:rows)
      Builder.build(data.rows) do |rows|
        tag(:tbody, rows.map { |cols| tr(cols) })
      end
    end
  end

  class Tr < Struct.new(:columns)
    def to_html
      Builder.build(columns) do |cols|
        tag(:tr, list(:td, cols))
      end
    end
  end
end
