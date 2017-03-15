class Department < ApplicationRecord
	has_many :users
	has_many :statuses
	validates :departmentName, :presence => :true
	
end
