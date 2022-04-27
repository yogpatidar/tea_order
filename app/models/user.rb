class User < ApplicationRecord
   has_many :orders
   has_secure_password
   validates :email, :presence => true, :uniqueness => true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/,message: 'Full name must be between 5 and 30 characters' }
end


