class CreatePieces < ActiveRecord::Migration[4.2]
  def change
    create_table :pieces do |t|
      t.references :artist, index: true
      t.string :name
      t.text :description
      t.date :date
      
      t.string :upload_url
      t.string :upload_key
      t.timestamps
    end
  end
end
