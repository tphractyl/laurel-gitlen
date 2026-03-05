class AddCurrentToExhibition < ActiveRecord::Migration[4.2]
  def change
    add_column :exhibitions, :current, :boolean, default: false
  end
end
