require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create user" do
  	user = User.new :email => users(:kathia).email,
                    :password => users(:kathia).password,
                    :username => "Kathia 2",
                    :department => nil,
                    :position => users(:kathia).position,
                    :isGeneralAdmin => users(:kathia).isGeneralAdmin,
                    :isDepartmentAdmin => users(:kathia).isDepartmentAdmin
  	assert user.save , "Se guardo un usuario sin department"
  end

end
