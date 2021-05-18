class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 8..20

  validates_confirmation_of :password
  validates_format_of :password, :with => /\A[a-zA-Z0-9]+\z/
  
  
end
