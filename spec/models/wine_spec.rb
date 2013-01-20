require 'spec_helper'
require File.dirname(__FILE__) + "/../../app/models/wine"

describe Wine do
  before do
    @wine = FactoryGirl.create(:wine)
  end

  describe "find non existing wine" do
    it "returns nil" do
      Wine.find_by_name("Not to be found").should be_nil
    end
  end

  describe "find existing wine" do
    it "returns wine" do
      Wine.find_by_name(@wine.name).should_not be_nil
    end
  end

end