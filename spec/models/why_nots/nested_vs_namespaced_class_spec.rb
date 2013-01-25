require "spec_helper"

describe WhyNots do
  it 'has access to its own FAVORITE_AUTHOR' do
    subject::FAVORITE_AUTHOR.should == "Sofi Oksanen"
  end
end

describe WhyNots::NestedClass do
  it 'has access to its own FAVORITE_COLOR constant' do
    subject.class::FAVORITE_COLOR.should == :white
  end

  it 'has access to nested modules FAVORITE_AUTHOR constant' do
    subject.class.favorite_author.should == "Sofi Oksanen"
  end
end

describe WhyNots::NamespacedClass do
  it 'has access to its own FAVORITE_NUMBER constant' do
    subject.class::FAVORITE_NUMBER.should == 777
  end

  it 'does not have access to name-spaced modules FAVORITE_AUTHOR constant' do
    lambda { subject.class.favorite_author }.should raise_error(NameError)
  end
end