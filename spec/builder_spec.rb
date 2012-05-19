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
    html = HTML::Builder.new(Dummy)
    output = html.build { foo_bar(foo("foo"), "bar") }
    output.should eq("foo+bar")
  end

  it "has a convenience method for building html" do
    output = HTML::Builder.build(Dummy) { foo_bar(foo("foo"), "bar") }
    output.should eq("foo+bar")
  end

  it "will not hijack the block scope if asked to yield a parameter" do
    foo, baz = "foo", "baz"
    output = HTML::Builder.build(Dummy) do |h|
      h.foo_bar(h.foo(foo), h.foo_bar("bar", baz))
    end
    output.should eq("foo+bar+baz")
  end
end
