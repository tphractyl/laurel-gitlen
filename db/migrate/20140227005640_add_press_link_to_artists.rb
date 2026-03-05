class AddPressLinkToArtists < ActiveRecord::Migration[4.2]
  def change
    add_column :artists, :press_url, :string
  end
end
