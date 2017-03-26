class CreateArchives < ActiveRecord::Migration[5.0]
  def change
    create_table :archives do |t|
      t.references :document, foreign_key: true
      t.string :archive

      t.timestamps
    end
  end
end
