class Document < ApplicationRecord
  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_id'
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :senderStatus, :class_name => 'Status', :foreign_key => 'senderStatus_id'
  belongs_to :receiverStatus, :class_name => 'Status', :foreign_key => 'receiverStatus_id'
  #validates :documentCode, :presence => :true
  #validates :subject, :presence => :true
  #validates :date, :presence => :true
  #validates :content, :presence => :true
  has_many :images
end
