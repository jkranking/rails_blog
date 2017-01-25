class User < ApplicationRecord

  has_secure_password

	has_many :posts

  validates :password_digest, :email, { presence: true }
  validates_uniqueness_of :email

end 