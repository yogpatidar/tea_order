class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :order_menus
  has_many :menus, :through => :order_menus
end
