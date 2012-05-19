require "spec_helper"
require "html/sequence"

describe HTML::Sequence do
  let(:tag) { Min::String.new("p") }
  let(:content) { Min::Enum.new([1, 2]) }

  it "turns enumerables into sequences of html tags" do
    html = HTML::Sequence.new(tag, content).to_html
    html.should eq("<p>1</p><p>2</p>")
  end
end
