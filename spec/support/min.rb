# Min classes convert any interface-abiding instance into the minimal
# interface-abiding instance. Min classes exists to enforce the minimal
# contracts in tests. Do not add behavior to Min classes.

module Min
  class Enum
    include Enumerable

    def initialize(enum)
      @enum = enum
    end

    def each(*args, &block)
      @enum.each(*args, &block)
    end
  end

  class String
    def initialize(string)
      @string = string
    end

    def to_s
      @string.to_s
    end
  end
end
