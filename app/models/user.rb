class User < ApplicationRecord
    has_secure_password
    validates :user_name, uniqueness: true,
                          presence: true
    validates :password_digest, presence: true
    
    
    has_many :memberships
    has_many :navers, through: :memberships
    
    has_many :posts
end
