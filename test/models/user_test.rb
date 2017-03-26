require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "User without email" do
  	user = User.new
  	assert_not user.save, "Saved user without email"
  end
  test "should report error" do
	  # some_undefined_variable is not defined elsewhere in the test case
	  assert_raises(NameError) do
	    some_undefined_variable
	  end
  end
end
