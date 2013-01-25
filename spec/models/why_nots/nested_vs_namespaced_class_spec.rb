require "spec_helper"

describe WhyNots do
  it 'has access to top level FAVORITE_YEAR constant' do
    subject.favorite_year.should == 2013
  end

  it 'exposes its own FAVORITE_AUTHOR' do
    subject::FAVORITE_AUTHOR.should == "Sofi Oksanen"
  end
end

describe WhyNots::NestedClass do
  it 'has access to top level FAVORITE_YEAR constant' do
    subject.class.favorite_year.should == 2013
  end

  it 'exposes its own FAVORITE_COLOR constant' do
    subject.class::FAVORITE_COLOR.should == :white
  end

  it 'has access to nested modules FAVORITE_AUTHOR constant' do
    subject.class.favorite_author.should == "Sofi Oksanen"
  end

  it 'has access to nested modules FAVORITE_BOOK constant' do
    subject.class.favorite_book.should == "Purge"
  end
end

describe WhyNots::NamespacedClass do
  it 'has access to top level FAVORITE_YEAR constant' do
    subject.class.favorite_year.should == 2013
  end

  it 'exposes its own FAVORITE_NUMBER constant' do
    subject.class::FAVORITE_NUMBER.should == 777
  end

  it 'does not have access to name-spaced modules FAVORITE_AUTHOR constant' do
    lambda { subject.class.favorite_author }.should raise_error NameError
  end

  it 'does not have access to name-spaced modules FAVORITE_BOOK constant' do
    lambda { subject.class.favorite_book }.should raise_error NameError
  end
end