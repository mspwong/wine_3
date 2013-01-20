module WhyNots
  class Base
    def greet(msg)
      "#{greeting(123)}, #{msg}"
    end

    private

    def greeting(param)
      puts "!!!!!!!!!!! base greeting"
      "Hello"
    end
  end
end