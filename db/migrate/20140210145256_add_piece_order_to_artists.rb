class AddPieceOrderToArtists < ActiveRecord::Migration[4.2]
  def change
    add_column :artists, :piece_order, :string
  end
end
