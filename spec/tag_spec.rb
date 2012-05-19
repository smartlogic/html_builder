require "spec_helper"
require "html/tag"

describe HTML::Tag do
  let(:tag) { Min::String.new("p") }
  let(:content) { Min::String.new("Test") }

  it "turns strings into an html elements" do
    html = HTML::Tag.new(tag, content).to_html
    html.should eq("<p>Test</p>")
  end
end
