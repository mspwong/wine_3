require 'spec_helper'

describe WhyNots do

  it "has its own class method" do
    subject.methods.include?(:my_own).should be_true
  end
end

describe WhyNots::MyModule do

  it "does not have its nesting module's class method" do
    subject.methods.include?(:my_own).should be_false
  end

  it "its parent(WhyNots) has its nesting module's class method" do
    subject.parent.methods.include?(:my_own).should be_true
  end

  it "has mixed in module's class method" do
    subject.methods.include?(:other_module_name).should be_true
  end
end