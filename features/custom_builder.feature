Feature: Custom Builders

  Scenario: Defining a custom builder
    Given a file named "custom_builder.rb" with:
    """ruby
    require "html/builder"
    require "html/tag"
    require "html/list"

    module HTML
      class Footer < Struct.new(:owner, :year)
        def copyright
          "&copy; #{year} #{owner}"
        end

        def to_html
          Tag.new(:p, copyright).to_html
        end
      end
    end

    output = HTML::Builder.build do
      list([1, 2]) + footer("Foo, Inc.", 2012)
    end

    print output
    """
    When I run `ruby custom_builder.rb`
    Then the output should contain exactly:
    """html
    <ul><li>1</li><li>2</li></ul><p>&copy; 2012 Foo, Inc.</p>
    """
