require 'spec_helper'

describe WhyNots::MyClass do

  it "has access to included module's instance method" do
    subject.call_debug.should == WhyNots::MyClass
  end

  it "has access to included module's class method" do
    subject.call_debug_module.should == Module
  end

  it "exposes included module's instance method" do
    subject.respond_to?(:debug).should be_true
  end

  it "is of the correct class" do
    subject.instance_of?(WhyNots::MyClass).should be_true
  end

  it "its class is a Class object" do
    subject.class.instance_of?(Class).should be_true
  end

  it "its class is a Class object" do
    subject.class.class.should == Class
  end

  it "its class has the correct superclass" do
    subject.class.superclass.should == Object
  end

  it "its class has the correct parent" do
    subject.class.parent.should == WhyNots
  end

  it "its class has the correct ancestors" do
    subject.class.ancestors[0..2].should == [WhyNots::MyClass, WhyNots::MyModule, Object]
  end

  it "its class has included module's extended module's class method, thru class's ancestors" do
    subject.class.ancestors[1].methods.include?(:other_module_name).should be_true
  end

  it "its class has included module's thru its included_modules" do
    subject.class.included_modules.should include WhyNots::MyModule
  end

  it "its class does not have included module's extended module's thru its included_modules" do
    subject.class.included_modules.should_not include WhyNots::MyOtherModule
  end

  it "has its own instance variables" do
    subject.instance_variables.should == [:@my_class_var]
  end
end