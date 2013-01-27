require 'spec_helper'

describe WhyNots::MyClass do

  it "calls included module's method" do
    subject.call_debug.should == WhyNots::MyClass
  end

  it "calls included module's class method" do
    subject.call_debug_module.should == Module
  end

  it "has the correct class" do
    subject.instance_of?(WhyNots::MyClass).should be_true
  end

  it "has the correct class" do
    subject.class.instance_of?(Class).should be_true
  end

  it "has the correct class" do
    subject.class.class.should == Class
  end

  it "has the correct superclass" do
    subject.class.superclass.should == Object
  end

  it "has the correct parent" do
    subject.class.parent.should == WhyNots
  end

  it "has the correct ancestors" do
    subject.class.ancestors[0..2].should == [WhyNots::MyClass, WhyNots::MyModule, Object]
  end

  it "has mixed in module's class method, but not the way expected !!!!!" do
    subject.class.ancestors[1].methods.include?(:other_module_name).should be_true
  end
end