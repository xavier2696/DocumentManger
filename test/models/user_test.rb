require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create user" do
    
    department_id = departments(:dep2).id

    Rails::logger.debug "Departamento"
    Rails::logger.debug department_id
  	user = User.new(:email => "KathiaB@gmail.com",
                    :password => "123456",
                    :username => "Kathia Barahona",
                    :department_id => department_id,
                    :position => "Admin",
                    :isGeneralAdmin => true,
                    :isDepartmentAdmin => true)

  	assert user.save
    user_copy = User.find(user.id)
    assert_equal user.username, user_copy.username
    assert user.destroy
  end

end
