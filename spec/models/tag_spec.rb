require 'spec_helper'

describe Tag do

  describe 'scopes' do
    describe ':red' do
      it 'returns tags whose names include "red"' do
        red = FactoryGirl.create(:tag, :red)
        FactoryGirl.create(:tag, :white)

        Tag.red.should == [red]
      end
    end

    describe ':new' do
      it 'returns new tags' do
        FactoryGirl.create(:tag, created_at: 1.day.ago)
        FactoryGirl.create(:tag, created_at: Time.zone.now)
        new_ones = FactoryGirl.create(:tag, created_at: 1.day.from_now)

        Tag.to_come.should == [new_ones]
      end
    end
  end
end