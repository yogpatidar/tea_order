class CreateShopMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_menus do |t|
      t.integer :shop_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
