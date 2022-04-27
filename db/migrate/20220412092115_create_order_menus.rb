class CreateOrderMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :order_menus do |t|
      t.integer :menu_id
      t.integer :order_id
    
      t.timestamps
    end
  end
end
