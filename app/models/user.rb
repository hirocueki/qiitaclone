class User < ApplicationRecord
    has_many :items
    has_secure_password
    validates :email, :password_digest, presence: true
end
