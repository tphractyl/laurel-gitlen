class AddArtFairToExhibitions < ActiveRecord::Migration[4.2]
  def change
    add_column :exhibitions, :art_fair, :boolean, default: false
  end
end
