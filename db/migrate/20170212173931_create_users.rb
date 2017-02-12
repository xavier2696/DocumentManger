class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :username
      t.references :department, foreign_key: true
      t.string :position
      t.boolean :isGeneralAdmin
      t.boolean :isDepartmentAdmin

      t.timestamps
    end
  end
end
