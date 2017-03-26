require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "departmentCreate" do
  	department = Department.new :departmentName => departments(:dep1).departmentName
  	assert department.save
    department_copy = Department.find(department.id)
    assert_equal department.departmentName, department_copy.departmentName
    assert department.destroy
  end
end
