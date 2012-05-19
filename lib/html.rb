class HTML < BasicObject
  def self.build(namespace = ::Object, &block)
    new(namespace).build(&block)
  end

  def initialize(namespace = ::Object)
    @namespace = namespace
  end

  def build(&block)
    if block.arity > 0
      yield self
    else
      instance_eval(&block)
    end
  end

  def method_missing(method, *args, &block)
    class_name = method.to_s.split("_").map(&:capitalize).join
    klass = @namespace.const_get(class_name)
    klass.new(*args).to_html
  end
end
