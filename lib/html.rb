require "html/builder"

module HTML
  def build(object = nil, &block)
    Builder.new(object, HTML).build(&block)
  end
  module_function :build
end
