class CreateJoinTableArtistsStories < ActiveRecord::Migration[4.2]
  def change
    create_join_table :artists, :stories
  end
end
