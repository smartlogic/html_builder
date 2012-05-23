require "html"

module HTML
  class Map < Struct.new(:builder, :enum)
    def to_html
      HTML.build(self) do |map|
        map.enum.map { |item| __send__(map.builder, item) }.join
      end
    end
  end
end
