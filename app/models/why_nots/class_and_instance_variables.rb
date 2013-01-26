module WhyNots
  class Polygon
    @@sides_class = 10
    def self.sides_class
      @@sides_class
    end
    def self.sides_class=(value)
      @@sides_class = value
    end

    @sides_class_instance = 10
    class << self
      attr_accessor :sides_class_instance
    end
  end

  class Triangle < Polygon
    @@sides_class = 3
    @sides_class_instance = 3
  end

  class Rectangle < Polygon
    @@sides_class = 4
    @sides_class_instance = 4
  end
end