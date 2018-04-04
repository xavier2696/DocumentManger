class Department < ApplicationRecord
	has_many :users
	has_many :statuses
	has_many :tags
	validates :departmentName, :presence => :true

end
