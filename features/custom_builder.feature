Feature: Custom Builders

  Scenario: Defining a custom builder
    Given a file named "custom_builder.rb" with:
    """ruby
    require "html"
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

    output = HTML.build do
      list(:p, [1, 2]) + footer("Foo, Inc.", 2012)
    end

    print output
    """
    When I run `ruby custom_builder.rb`
    Then the output should contain exactly:
    """html
    <p>1</p><p>2</p><p>&copy; 2012 Foo, Inc.</p>
    """
