module HTML
  class Text < Struct.new(:content)
    def to_html
      [*content].join
    end
  end
end
