module WhyNots
  class MyClass
    include MyModule

    def call_debug
      debug
    end

    def call_debug_module
      MyModule.debug_module
    end
  end
end