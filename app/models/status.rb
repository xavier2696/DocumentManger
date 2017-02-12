class Status < ApplicationRecord
  belongs_to :department
  has_many :sentDocuments, :class_name => 'Document', :foreign_key => 'senderStatus_id'
  has_many :receivedDocuments, :class_name => 'Document', :foreign_key => 'receiverStatus_id'
end
