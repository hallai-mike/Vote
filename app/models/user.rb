class User < ApplicationRecord
	validates :username, presence: true, length: { maximum: 45 }, uniqueness: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }



end
