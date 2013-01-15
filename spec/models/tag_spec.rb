require 'spec_helper'

describe Tag do

  describe 'scope :red' do
    it 'returns tags whose names include "red"' do
      red = FactoryGirl.create(:tag, :red)
      FactoryGirl.create(:tag, :white)

      Tag.red.should == [ red ]
    end
  end
end