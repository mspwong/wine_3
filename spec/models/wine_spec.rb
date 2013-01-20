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

  describe "active record dynamic finders" do
    describe "respond_to? find_by_varietal" do
      it "returns true" do
        Wine.respond_to?(:find_by_varietal).should be_true
      end
    end

    describe "respond_to? find_all_by_varietal" do
      it "returns true" do
        Wine.respond_to?(:find_all_by_varietal).should be_true
      end
    end

    describe "respond_to? find_last_by_varietal" do
      it "returns true" do
        Wine.respond_to?(:find_last_by_varietal).should be_true
      end
    end

    describe "respond_to? find_or_initialize_by_varietal" do
      it "returns true" do
        Wine.respond_to?(:find_or_initialize_by_varietal).should be_true
      end
    end

    describe "respond_to? find_or_create_by_varietal" do
      it "returns true" do
        Wine.respond_to?(:find_or_create_by_varietal).should be_true
      end
    end

    describe "respond_to? get_by_varietal" do
      it "returns false" do
        Wine.respond_to?(:get_by_varietal).should be_false
      end
    end
  end

end