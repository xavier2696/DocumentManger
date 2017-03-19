class AddPictureToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :picture, :string
  end
end
