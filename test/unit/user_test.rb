require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:wine_spectator)
  end
  subject { @user }

  #should_have_many :reviews
  #should_have_many :wines
  #should_have_and_belong_to_many :programs

  context "Validating a valid user" do
    should "validate" do
      assert_nothing_raised { User.create!(:name => "test name") }
      assert_nothing_raised { User.create!(:name => "12345678901234567890123456789012345678901234567890") }
    end
  end

  context "Validating an invalid user" do
    should "raise AssertionFailedError" do
      assert_raise(ActiveRecord::RecordInvalid) { User.create! }    # TODO:  validates_presence of :name was not required to pass this in rails 2
      assert_raise(ActiveRecord::RecordInvalid) { User.create!(:name => "123456789012345678901234567890123456789012345678901") }
    end
  end

  context "Finding user's reviews" do
    should "exclude reviews that are inactive" do
      assert @user.reviews.first.active

      assert_difference '@user.reviews.size', -1 do
        @user.reviews.first.update_attribute(:active, false)
      end
    end
  end

  context "Updating user" do
    should "synchronize its reviews status" do
      setup do
        assert @user.active
        @user.reviews.each { |r| assert r.active }
      end

      assert_no_difference '@user.reviews.size' do
        @user.update_attribute(:active, false)
      end
      assert !@user.active
      @user.reviews.each { |r| assert !r.active }
    end
  end

  context "Given a user" do
    should "be able to navigate to the wines it reviewed" do
      assert_equal 2, @user.wines.size
    end
  end

  context "Given a user" do
    should "be able to navigate to the programs it belongs to" do
      assert_equal 2, @user.programs.size

      parker = users(:parker)
      assert_equal 0, parker.programs.size
    end
  end

  context "Active records mapping of inheritance hierarchy:  " do
    context "looking up users" do
      should "return users" do
        assert_equal 6, User.all.size
        assert_equal "User", User.find_by_name("Robert Parker").class.to_s
        assert_equal "Buyer", User.find_by_name("mark").class.to_s
        assert_equal "Seller", User.find_by_name("fred").class.to_s
      end
    end

    context "looking up buyers" do
      should "return buyers" do
        assert_equal 2, Buyer.all.size
        assert_equal "Buyer", User.find_by_name("mark").class.to_s
        assert_equal "Buyer", Buyer.find_by_name("mark").class.to_s
        assert_nil Seller.find_by_name("mark")
      end
    end

    context "looking up sellers" do
      should "return sellers" do
        assert_equal 2, Seller.all.size
        assert_equal "Seller", User.find_by_name("fred").class.to_s
        assert_equal "Seller", Seller.find_by_name("fred").class.to_s
        assert_nil Buyer.find_by_name("fred")
      end
    end
  end

end