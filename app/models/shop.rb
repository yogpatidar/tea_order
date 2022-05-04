class Shop < ApplicationRecord
   has_many :orders 
   has_many :menus, through: :shop_menus
   has_secure_password
   validates :email, uniqueness: true
end
