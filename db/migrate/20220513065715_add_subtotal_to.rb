class AddSubtotalTo < ActiveRecord::Migration[7.0]
  def change
    add_column :order_menus, :subtotal, :float
  end
end
