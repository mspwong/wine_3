module WhyNots
  class Sub < Base

    private

    def greeting(msg)
      puts "!!!!!!!!!!!!!! informal greeting"
      "Hey #{super}"
    end
  end
end
