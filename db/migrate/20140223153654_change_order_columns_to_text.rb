class ChangeOrderColumnsToText < ActiveRecord::Migration[4.2]
  def up
    change_column :artists, :piece_order, :text
    change_column :exhibitions, :piece_order, :text
  end

  def down
    change_column :artists, :piece_order, :string
    change_column :exhibitions, :piece_order, :string
  end
end
