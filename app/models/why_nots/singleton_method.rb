module WhyNots
  class SingletonMethod; end

  class MyClass
    def MyClass.first_class_singleton_method
      1
    end

    def self.second_class_singleton_method
      2
    end

    class << self
      def third_class_singleton_method
        3
      end
    end

    class << MyClass
      def forth_class_singleton_method
        4
      end
    end
  end

  def MyClass.fifth_class_singleton_method
    5
  end

  MyClass.define_singleton_method(:sixth_class_singleton_method) do
    6
  end

end