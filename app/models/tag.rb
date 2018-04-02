class Tag < ApplicationRecord
    has_and_belongs_to_many :documents
    validates :tagName, presence: true
    validates_uniqueness_of :tagName, scope: :department_id
end
