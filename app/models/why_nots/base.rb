module WhyNots
  class Base
    def greet(msg)
      "#{greeting(123)}, #{msg}"
    end

    private

    def greeting(param)
      "Hello"
    end
  end
end