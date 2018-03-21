# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.create("departmentName"=>"INFORMATICA")
Department.create("departmentName"=>"INFRAESTRUCTURA")

User.create("email"=>"superadmin@test.com", "password"=>"superadmin", "username"=>"Super Admin", "department_id"=>1, "position"=>"Test", "isGeneralAdmin"=>true, "isDepartmentAdmin"=>false)
User.create("email"=>"admin_infor@test.com", "password"=>"admin_infor", "username"=>"Admin informatica", "department_id"=>1, "position"=>"Jefe", "isGeneralAdmin"=>false, "isDepartmentAdmin"=>true)
User.create("email"=>"admin_infra@test.com", "password"=>"admin_infra", "username"=>"Admin infraestructura", "department_id"=>2, "position"=>"Jefe", "isGeneralAdmin"=>false, "isDepartmentAdmin"=>true)

