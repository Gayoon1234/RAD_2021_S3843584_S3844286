Rails.application.routes.draw do
  get 'customers/new'

  get 'users/new'

  get 'items/new'

  get 'static_pages/home'
  
  root 'static_pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
