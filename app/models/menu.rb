class Menu < ApplicationRecord
  has_many :orders, through: :order_menus
  attr_accessor :terms_and_conditions
  has_one_attached :profile_image
end
