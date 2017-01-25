

class User < ApplicationRecord

  has_secure_password

	has_many :posts

  validates :password_digest, :email, { presence: true }
  validates_uniqueness_of :email

  # def password
  #   @password ||= Password.new(hashed_password)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.hashed_password = @password
  # end

  # def self.authenticate(email, password)
  #   p email
  #   p
  #   user = User.find_by(email: email)
  #   return nil if user.nil? || user.password != password
  #   user
  # end
end 