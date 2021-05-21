class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         #:omniauthable, omniauth_providers: %i[twitter], password_length: 8..20
         :omniauthable, :omniauth_providers => [:twitter], password_length: 8..20
  
  
  validates_uniqueness_of :username
  validates_confirmation_of :password
  validates_format_of :password, :with => /\A[a-zA-Z0-9]+\z/
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.username = auth.info.nickname 
    end
  end
  
end
