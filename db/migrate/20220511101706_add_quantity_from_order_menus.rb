class AddQuantityFromOrderMenus < ActiveRecord::Migration[7.0]
  def change

    add_column :order_menus, :quantity, :integer
  end
end


