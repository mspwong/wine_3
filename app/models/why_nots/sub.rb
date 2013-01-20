module WhyNots
  class Sub < Base

    private

    def greeting(msg)
      "Hey #{super}"
    end
  end
end
