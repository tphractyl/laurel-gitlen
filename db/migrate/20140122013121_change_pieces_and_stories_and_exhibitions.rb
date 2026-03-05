class ChangePiecesAndStoriesAndExhibitions < ActiveRecord::Migration[4.2]
  def change
    rename_column :exhibitions, :press_release, :press_release_url
    add_column :stories, :press_release_url, :string
    add_column :pieces, :featured, :boolean
    remove_column :pieces, :year, :string
    remove_column :pieces, :dimensions, :string
    remove_column :pieces, :edition_details, :string
  end
end
