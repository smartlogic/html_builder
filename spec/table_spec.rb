require "spec_helper"
require "html/table"

describe HTML::Table do
  it "renders an empty table given no data" do
    html = HTML::Table.new(stub).to_html
    html.should == "<table></table>"
  end

  it "renders the table header if the data source defines columns" do
    data = stub(:columns => [1])
    html = HTML::Table.new(data).to_html
    html.should eq("<table><thead><tr><td>1</td></tr></thead></table>")
  end

  it "renders the table body if the data source defines rows" do
    data = stub(:rows => [[1]])
    html = HTML::Table.new(data).to_html
    html.should eq("<table><tbody><tr><td>1</td></tr></tbody></table>")
  end
end
