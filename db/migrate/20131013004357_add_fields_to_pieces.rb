class AddFieldsToPieces < ActiveRecord::Migration[4.2]
  def change
    change_table :pieces do |t|
      t.rename :name, :title
      t.string :year
      t.string :dimensions
      t.string :edition_details
    end
  end
end

