require "spec_helper"

describe WhyNots::ClassAndInstanceVariables do
end

describe WhyNots::Polygon do
  it 'class variables are shared across base and subclasses and takes the value assigned last' do
    subject.class.sides_class.should == 4
  end

  it 'each base and subclass retains their own class instance variables' do
    subject.class.sides_class_instance.should == 10
  end
end

describe WhyNots::Triangle do
  it 'class variables are shared across base and subclasses and takes the value assigned last' do
    subject.class.sides_class.should == 4
  end

  it 'each base and subclass retains their own class instance variables' do
    subject.class.sides_class_instance.should == 3
  end
end

describe WhyNots::Rectangle do
  it 'class variables are shared across base and subclasses and takes the value assigned last' do
    subject.class.sides_class.should == 4
  end

  it 'each base and subclass retains their own class instance variables' do
    subject.class.sides_class_instance.should == 4
  end
end

