Creating a new kind of builder is simple:

```ruby
require "html/tag"

class HTML::Footer
  def initialize(creator, year)
    @creator = creator
    @year = year
  end

  def copyright
    "&copy; #@year #@creator"
  end

  def to_html
    Tag.new(:p, copyright)
  end
end
```

There is a fluent builder interface for easy HTML construction:

```ruby
require "html/builder"
require "html/list"

HTML::Builder.build do
  list([1, 2]) + footer("Foo Co.", 2012)
end
```

This outputs `<ul><li>1</li><li>2</li></ul><p>&copy; Foo Co. 2012</p>`
