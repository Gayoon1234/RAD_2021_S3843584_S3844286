class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  $featuredItem = Item.find(1)
  
end
