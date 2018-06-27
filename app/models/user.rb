class User < ApplicationRecord
    has_secure_password
    has_many :memberships
    has_many :navers, through: :memberships
    
    has_many :posts
end
