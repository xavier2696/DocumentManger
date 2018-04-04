require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "statusCreate" do
  	department = Department.new(departmentName: "test")
    department.save

    status = Status.new(:description => "este es un estado",
    					:department_id => department.id)
    assert status.save
    status_copy = Status.find(status.id)
    assert_equal status.description, status_copy.description
    assert status.destroy
  end

#TO-DO (Hacer funcionar la prueba statusCreate_nil_description,
# 		creo que no deja hacer el test con la descripcion nula por la base de datos, ya que es requerido el campo)
#  test "statusCreate_nil_description" do
#  	department = Department.new(departmentName: "test2") 
#    department.save

#    status = Status.new(:description=> nil,
#    					:department_id => department.id)
#    status.save
#    assert !status.valid?
#    refute !status.valid?
#    assert_match /blanco/, status.errors[:description].to_s
#  end
end