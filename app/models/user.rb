class User < ApplicationRecord
    has_many :characters
    has_secure_password

    validates :password, presence: true
end
