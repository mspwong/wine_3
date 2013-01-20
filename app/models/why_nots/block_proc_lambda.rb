module WhyNots
  class BlockProcLambda

    def what_am_i(&block)
      block.class
    end

    def straight_forward(id, stuff, block)
      call_proc(id, stuff, block)
    end

    def surprise(id, stuff, block)
      call_proc(id, stuff, block)
      'not what you think'
    end

    private

    def call_proc(id, stuff, block)
      block.call(id, stuff)
    end
  end
end