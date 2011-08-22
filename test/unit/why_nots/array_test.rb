require "test_helper"
require "why_nots/array"

class ArrayTest < ActiveSupport::TestCase

  context "given an array" do
    should "return the duplicates" do
      a = (1..100).to_a
      a << 6 << 4 << 23
      assert_equal [6, 4, 23], a.duplicate
    end
  end
end