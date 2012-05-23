require "spec_helper"
require "html/builder"

module Dummy
  Foo = Struct.new(:foo) do
    def to_html
      foo.to_s
    end
  end

  FooBar = Struct.new(:foo, :bar) do
    def to_html
      "#{foo}+#{bar}"
    end
  end
end

describe HTML::Builder do
  it "provides a fluent builder for html" do
    html = HTML::Builder.new(nil, Dummy)
    output = html.build { foo_bar(foo("foo"), "bar") }
    output.should eq("foo+bar")
  end

  it "has a convenience method for building html" do
    output = HTML::Builder.build(nil, Dummy) { foo_bar(foo("foo"), "bar") }
    output.should eq("foo+bar")
  end

  it "will inject a provided object into its scope as a block parameter" do
    object = stub(:foo => "foo", :baz => "baz")
    output = HTML::Builder.build(object, Dummy) do |obj|
      foo_bar(foo(obj.foo), foo_bar("bar", obj.baz))
    end
    output.should eq("foo+bar+baz")
  end
end
