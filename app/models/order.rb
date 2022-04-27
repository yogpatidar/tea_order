class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :menus, :through => :order_menus
end
