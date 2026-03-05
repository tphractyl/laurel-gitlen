class AddGalleryRosterToArtists < ActiveRecord::Migration[4.2]
  def change
    add_column :artists, :gallery_roster, :boolean, default: true
  end
end
