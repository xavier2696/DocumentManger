require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "createUser" do
    
    #department_id = departments(:dep2).id

    #Rails::logger.debug "Departamento"
    #Rails::logger.debug department_id

    department = Department.new(departmentName: "newDepartamnt")
    department.save

  	user = User.new(:email => "newuser@email.com",
                    :password => "password",
                    :username => "New User",
                    :department_id => department.id,
                    :position => "Admin",
                    :isGeneralAdmin => true,
                    :isDepartmentAdmin => true)
  	assert user.save
    user_copy = User.find(user.id)
    assert_equal user.username, user_copy.username
    assert user.destroy
  end

  test "createUserPasswordNull" do
    user = User.new(password: nil)
    assert !user.valid?
    refute user.valid?
    assert_match /blanco/, user.errors[:password].to_s
  end

  test "createUserUsernameNull" do
    user = User.new(username: nil)
    assert !user.valid?
    refute user.valid?
    assert_match /blanco/, user.errors[:username].to_s
  end

end

=begin
------------------TO DO------------
--Caso de prueba donde se valide la entrada tipo Boolean y no otro tipo de dato
  en los atributos de isGeneralAdmin y isDepartmentAdmin 
--Caso de prueba cuando el email y position sea nulo
--Caso de prueba donde la entrada sea todo el objeto User vacio. 

=end


