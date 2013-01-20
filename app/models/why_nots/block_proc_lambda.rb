module WhyNots
  class BlockProcLambda

    def what_am_i(&block)
      block.class
    end

    def proc_is_last(id, stuff, block)
      block.call(id, stuff)
    end

    def proc_is_not_last(id, stuff, block)
      block.call(id, stuff)
      return 'not what you think'
    end

    def lambda_return
      lambda { return 'lambda'}.call
      return 'lambda_return method finished'
    end

    def proc_return
      Proc.new { return 'proc'}.call
      return 'proc_return method finished'
    end

  end
end