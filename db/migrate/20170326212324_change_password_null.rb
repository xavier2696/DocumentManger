class ChangePasswordNull < ActiveRecord::Migration[5.0]
  def change
  	change_column_null :users, :password, true
  end
end
