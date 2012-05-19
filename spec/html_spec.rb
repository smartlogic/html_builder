require "html"

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

describe HTML do
  it "provides a fluent builder for html" do
    html = HTML.new(Dummy)
    output = html.build { foo_bar(foo("foo"), "bar") }
    output.should eq("foo+bar")
  end

  it "has a convenience method for building html" do
    output = HTML.build(Dummy) { foo_bar(foo("foo"), "bar") }
    output.should eq("foo+bar")
  end

  it "will not hijack the block scope if asked to yield a parameter" do
    foo, baz = "foo", "baz"
    output = HTML.build(Dummy) { |h| h.foo_bar(h.foo(foo), h.foo_bar("bar", baz)) }
    output.should eq("foo+bar+baz")
  end
end
