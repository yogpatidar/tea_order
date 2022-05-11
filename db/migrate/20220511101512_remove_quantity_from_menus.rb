class RemoveQuantityFromMenus < ActiveRecord::Migration[7.0]
  def change
    remove_column :menus, :quantity, :integer
  end
end
