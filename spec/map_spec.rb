require "spec_helper"
require "html/map"

module HTML
  class MapTestBuilder < Struct.new(:n)
    def to_html
      "#{n} + #{n} = #{n + n}\n"
    end
  end
end

describe HTML::Map do
  let(:content) { Min::Enum.new([1, 2]) }

  it "maps an enumerable over a builder" do
    html = HTML::Map.new(:map_test_builder, content).to_html
    html.should eq("1 + 1 = 2\n2 + 2 = 4\n")
  end
end
