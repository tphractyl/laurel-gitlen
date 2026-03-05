class AddCvUrlToArtists < ActiveRecord::Migration[4.2]
  def change
    add_column :artists, :cv_url, :string
  end
end
