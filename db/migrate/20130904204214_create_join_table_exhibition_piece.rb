class CreateJoinTableExhibitionPiece < ActiveRecord::Migration[4.2]
  def change
    create_join_table :exhibitions, :pieces, table_name: :displays
  end
end
