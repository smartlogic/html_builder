require "spec_helper"
require "html/list"

describe HTML::List do
  let(:content) { Min::Enum.new([1, 2]) }

  it "turns enumerables into html lists" do
    html = HTML::List.new(content).to_html
    html.should eq("<ul><li>1</li><li>2</li></ul>")
  end
end
