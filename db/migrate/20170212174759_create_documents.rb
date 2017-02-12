class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :documentCode
      t.string :subject
      t.date :date
      t.text :content
      t.string :tags
      t.integer :conversationId
      t.boolean :isSenderPrivate
      t.boolean :isReceiverPrivate

      t.timestamps
    end
    add_reference :documents, :sender, references: :users, index: true
    add_foreign_key :documents, :users, column: :sender_id
    add_reference :documents, :receiver, references: :users, index: true
    add_foreign_key :documents, :users, column: :receiver_id
    add_reference :documents, :creator, references: :users, index: true
    add_foreign_key :documents, :users, column: :creator_id
    add_reference :documents, :senderStatus, references: :statuses, index: true
    add_foreign_key :documents, :statuses, column: :senderStatus_id
    add_reference :documents, :receiverStatus, references: :statuses, index: true
    add_foreign_key :documents, :statuses, column: :receiverStatus_id
  end
end
