class Customer < ApplicationRecord
    
    validates :username, presence: true
    
    REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    validates :email, presence: true, format: { with: REGEX},
                                      uniqueness: { case_sensitive: false }
    
  
    before_save { self.email = self.email.downcase }
    
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    
    
end
