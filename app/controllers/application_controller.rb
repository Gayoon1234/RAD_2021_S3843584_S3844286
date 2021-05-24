class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :update_allowed_parameters, if: :devise_controller?
 
     protected
     def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation)} #!look at this for forget password potentially!#
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
     end
  
  
  def checkoutCart
    
    userNameVar = current_user.username
    
    Cart.where(username: userNameVar).destroy_all
    
  end
  
end
