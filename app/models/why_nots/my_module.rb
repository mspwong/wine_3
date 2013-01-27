module WhyNots

  def self.my_own
    'my_own'
  end

  module MyModule
    extend WhyNots::MyOtherModule

    def MyModule.debug_module
      self.class
    end

    def debug
      self.class
    end
  end
end