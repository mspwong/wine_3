require 'spec_helper'

describe WhyNots::MyClass do

  it "calls included module's method" do
    subject.call_debug.should == WhyNots::MyClass
  end

  it "calls included module's class method" do
    subject.call_debug_module.should == Module
  end

  it "has mixed in module's class method, but not the way expected !!!!!" do
    subject.class.ancestors[1].methods.include?(:other_module_name).should be_true
  end
end