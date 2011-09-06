require "rspec"
require File.dirname(__FILE__) + '/../../app/models/why_nots/pig_latin'

describe "PigLatin should translate" do
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

  context "'Hello World!!!'" do
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
