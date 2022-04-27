class AddQuantityToMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :quantity, :integer
  end
end
