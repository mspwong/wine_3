require "spec_helper"

describe WhyNots do
  it 'has access to top level FAVORITE_YEAR constant' do
    subject.favorite_year.should == 2013
  end

  it 'exposes its own FAVORITE_AUTHOR' do
    subject::FAVORITE_AUTHOR.should == "Sofi Oksanen"
  end

  it 'returns its constant' do
    subject.const_get(:FAVORITE_BOOK).should == "Purge"
  end

  it 'returns its ancestors constant' do
    subject.const_get(:FAVORITE_YEAR).should == 2013
  end

  it 'does not returns its ancestors constant' do
    lambda { subject.const_get(:FAVORITE_YEAR, false) }.should raise_error NameError
  end

  it 'returns all its constants, including class names' do
    subject.constants.should include(:FAVORITE_BOOK, :FAVORITE_AUTHOR, :NestedClass, :NamespacedClass, :ConstantAlwaysFound)
  end
end

describe WhyNots::NestedClass do
  it 'has access to top level FAVORITE_YEAR constant' do
    subject.class.favorite_year.should == 2013
  end

  it 'exposes its own FAVORITE_COLOR constant' do
    subject.class::FAVORITE_COLOR.should == :white
  end

  it 'has access to nesting modules FAVORITE_AUTHOR constant' do
    subject.class.favorite_author.should == "Sofi Oksanen"
  end

  it 'has access to nesting modules FAVORITE_BOOK constant' do
    subject.class.favorite_book.should == "Purge"
  end

  it 'returns its constant' do
    subject.class.const_get(:FAVORITE_COLOR).should == :white
  end

  it 'does not return its nesting module constant since module is not considered an ancestor' do
    lambda { subject.class.const_get(:FAVORITE_AUTHOR) }.should raise_error NameError
    lambda { subject.class.const_get(:FAVORITE_BOOK) }.should raise_error NameError
  end

  it 'returns the top level constant' do
    subject.class.const_get(:FAVORITE_YEAR).should == 2013
  end

  it 'does not return the top level constant' do
    lambda { subject.class.const_get(:FAVORITE_YEAR, false) }.should raise_error NameError
  end

  it 'returns all its constants' do
    subject.class.constants.should == [:FAVORITE_COLOR]
  end
end

describe WhyNots::NamespacedClass do
  it 'has access to top level FAVORITE_YEAR constant' do
    subject.class.favorite_year.should == 2013
  end

  it 'exposes its own FAVORITE_NUMBER constant' do
    subject.class::FAVORITE_NUMBER.should == 777
  end

  it 'does not have access to namespacing modules FAVORITE_AUTHOR constant' do
    lambda { subject.class.favorite_author }.should raise_error NameError
  end

  it 'does not have access to namespacing modules FAVORITE_BOOK constant' do
    lambda { subject.class.favorite_book }.should raise_error NameError
  end

  it 'returns its own constant' do
    subject.class.const_get(:FAVORITE_NUMBER).should == 777
  end

  it 'does not return its namespacing module constant since module is not considered an ancestor' do
    lambda { subject.class.const_get(:FAVORITE_AUTHOR) }.should raise_error NameError
    lambda { subject.class.const_get(:FAVORITE_BOOK) }.should raise_error NameError
  end

  it 'returns the top level constant' do
    subject.class.const_get(:FAVORITE_YEAR).should == 2013
  end

  it 'does not return the top level constant' do
    lambda { subject.class.const_get(:FAVORITE_YEAR, false) }.should raise_error NameError
  end

  it 'returns all its constants' do
    subject.class.constants.should == [:FAVORITE_NUMBER]
  end
end

describe WhyNots::ConstantAlwaysFound do
  it 'exposes its own FAVORITE_DAY constant' do
    subject.class::FAVORITE_DAY.should == :saturday
  end

  it 'returns its own constant' do
    subject.class.const_get(:FAVORITE_DAY).should == :saturday
  end

  it 'finds any constant' do
    subject.class.const_get(:FOO).should == "Here I am.  Yours truly, FOO"
  end

  it 'returns all its constants' do
    subject.class.constants.should == [:FAVORITE_DAY]
  end
end