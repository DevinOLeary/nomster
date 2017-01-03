class AlterPlacesAddColumnsInfo < ActiveRecord::Migration
  def change
    add_column :places, :phone, :string
    add_column :places, :hours, :text
    add_column :places, :website, :string
  end
end
