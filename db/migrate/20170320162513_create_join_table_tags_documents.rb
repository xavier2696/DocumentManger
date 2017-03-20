class CreateJoinTableTagsDocuments < ActiveRecord::Migration[5.0]
  def change
    create_join_table :tags, :documents do |t|
      # t.index [:tag_id, :document_id]
      # t.index [:document_id, :tag_id]
    end
  end
end
