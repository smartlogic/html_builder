require "spec_helper"
require "html/tag"

describe HTML::Tag do
  let(:tag) { Min::String.new("p") }

  it "turns strings into html elements" do
    string = Min::String.new("Test")
    html = HTML::Tag.new(tag, string).to_html
    html.should eq("<p>Test</p>")
  end

  it "turns enums until html elements" do
    enum = Min::Enum.new([2, 2])
    html = HTML::Tag.new(tag, enum).to_html
    html.should eq("<p>22</p>")
  end

  it "optionally adds attributes from a hash" do
    attrs = { :foo => "bar" }
    html = HTML::Tag.new(tag, nil, attrs).to_html
    html.should eq(%{<p foo="bar"></p>})
  end
end
