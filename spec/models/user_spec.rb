require 'spec_helper'

describe User do

  describe "active record dynamic finders" do
    describe "respond_to find_by_name" do
      it "returns true" do
        subject.class.respond_to?(:find_by_name).should be_true
      end
    end

    describe "respond_to? find_all_by_name" do
      it "returns true" do
        subject.class.respond_to?(:find_all_by_name).should be_true
      end
    end

    describe "respond_to? find_last_by_name" do
      it "returns true" do
        subject.class.respond_to?(:find_last_by_name).should be_true
      end
    end

    describe "respond_to? find_or_initialize_by_name" do
      it "returns true" do
        subject.class.respond_to?(:find_or_initialize_by_name).should be_true
      end
    end

    describe "respond_to? find_or_create_by_name" do
      it "returns true" do
        subject.class.respond_to?(:find_or_create_by_name).should be_true
      end
    end

    describe "respond_to? get_by_name" do
      it "returns false" do
        subject.class.respond_to?(:get_by_name).should be_false
      end
    end
  end

end