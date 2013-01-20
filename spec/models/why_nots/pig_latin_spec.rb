require "spec_helper"
require File.dirname(__FILE__) + '/../../../app/models/why_nots/pig_latin'

describe WhyNots::PigLatin do

  describe "'hello world'" do
    it "to 'ellohay orldway'" do
      WhyNots::PigLatin.translate('hello world').should == 'ellohay orldway'
    end
  end

  describe "'Hello World'" do
    it "to 'Ellohay Orldway'" do
      WhyNots::PigLatin.translate('Hello World').should == 'Ellohay Orldway'
    end
  end

  describe "'Hello World!!!'" do
    it "to 'Ellohay Orldway!!!'" do
      WhyNots::PigLatin.translate('Hello World!!!').should == 'Ellohay Orldway!!!'
    end
  end

  describe "'Hello, World!!!'" do
    it "to 'Ellohay, Orldway!!!'" do
      WhyNots::PigLatin.translate('Hello, World!!!').should == 'Ellohay, Orldway!!!'
    end
  end

end
