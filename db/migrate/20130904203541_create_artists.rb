class CreateArtists < ActiveRecord::Migration[4.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :cv_link

      t.timestamps
    end
  end
end
