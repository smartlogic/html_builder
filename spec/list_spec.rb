require "spec_helper"
require "html/list"

describe HTML::List do
  let(:content) { Min::Enum.new([1, 2]) }

  it "turns enumerables into html lists" do
    html = HTML::List.new(:p, content).to_html
    html.should eq("<p>1</p><p>2</p>")
  end
end
