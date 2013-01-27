module WhyNots
  class MyClass
    include MyModule

    def initialize
      @my_class_var = "hello"
    end

    def call_debug
      debug
    end

    def call_debug_module
      MyModule.debug_module
    end
  end
end