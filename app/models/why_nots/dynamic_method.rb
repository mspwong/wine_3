module WhyNots
  class DynamicMethod

    def method_missing(method_id, *args)
      "Cannot find instance method '#{method_id}' called with args: #{args}.  Making up behavior"
    end

  end
end