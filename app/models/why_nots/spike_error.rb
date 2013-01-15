module WhyNots
  class SpikeError

    def self.run
      begin
        raise_error
      rescue => e
        puts "Last error:  #{$!}"
        puts "Location:  #{$@}"
        #puts "Last error:  #{e}"
        #puts "message:  #{e.message}"
        puts "backtrace:  #{e.backtrace}"
      end
    end

    def self.raise_error
      raise "I am an error"
    end
  end
end