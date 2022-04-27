class AddShopToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :city, :string
    add_column :shops, :address, :string
    add_column :shops, :phone, :integer
    add_column :shops, :pin_code, :integer
  end
end
