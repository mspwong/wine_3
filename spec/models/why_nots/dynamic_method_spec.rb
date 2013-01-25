require 'spec_helper'

describe WhyNots::DynamicMethod do

  it 'makes up behavior when instance method missing' do
    subject.foo(1,2,3).should == "Cannot find instance method 'foo' called with args: [1, 2, 3].  Making up behavior"
  end

end