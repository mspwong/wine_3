module WhyNots
  class BlockProcLambdaMethodObject

    def what_am_i(&block)
      block.class
    end

    def what_kind_of_block_am_i(block)
      block.class
    end

    def block_is_last(id, stuff, block)
      block.call(id, stuff)
    end

    def block_is_not_last(id, stuff, block)
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