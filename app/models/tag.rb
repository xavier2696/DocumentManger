class Tag < ApplicationRecord
  belongs_to_many :documents
  belongs_to :department
  validates :tagName, presence: true, allow_blank: false
  validates :department_id, presence: true
  validates_uniqueness_of :tagName, scope: :department_id
  # Pendiente: has_and_belongs_to_many :department
end
