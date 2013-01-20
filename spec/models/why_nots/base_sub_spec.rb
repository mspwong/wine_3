require 'spec_helper'

describe WhyNots::Base do
  it 'greets correctly' do
    subject = WhyNots::Base.new
    subject.greet("welcome to my home.").should == "Hello, welcome to my home."
  end
end

describe WhyNots::Sub do
  it 'greets correctly' do
    subject = WhyNots::Sub.new
    subject.greet("welcome to my home.").should == "Hey Hello, welcome to my home."
  end
end
