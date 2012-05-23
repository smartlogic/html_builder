require "spec_helper"
require "html/text"

describe HTML::Text do
  it "turns strings into text" do
    string = Min::String.new("Test")
    html = HTML::Text.new(string).to_html
    html.should eq("Test")
  end

  it "turns enums until text" do
    enum = Min::Enum.new([2, 2])
    html = HTML::Text.new(enum).to_html
    html.should eq("22")
  end
end
