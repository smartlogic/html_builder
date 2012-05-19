require "spec_helper"
require "tag"

describe Tag do
  let(:tag) { Min::String.new("p") }
  let(:content) { Min::String.new("Test") }

  it "turns strings into an html elements" do
    html = Tag.new(tag, content).to_html
    html.should eq("<p>Test</p>")
  end
end
