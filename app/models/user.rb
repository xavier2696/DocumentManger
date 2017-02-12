class User < ApplicationRecord
  belongs_to :department
  has_many :sentDocuments, :class_name => 'Document', :foreign_key => 'sender_id'
  has_many :receivedDocuments, :class_name => 'Document', :foreign_key => 'receiver_id'
  has_many :createdDocuments, :class_name => 'Document', :foreign_key => 'creator_id'
end
