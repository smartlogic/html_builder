module HTML
  class Builder < BasicObject
    def self.build(object = nil, namespace = ::HTML, &block)
      new(object, namespace).build(&block)
    end

    def initialize(object = nil, namespace = ::HTML)
      @namespace = namespace
      @object = object
    end

    def build(&block)
      if block.arity > 0
        instance_exec(@object, &block)
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
end
