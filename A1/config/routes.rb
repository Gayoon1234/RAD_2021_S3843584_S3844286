Rails.application.routes.draw do
  
  

  get '/home', to: 'static_pages#home'

  get '/mens', to: 'static_pages#mens'

  get '/womens', to: 'static_pages#womens'

  get '/kids', to: 'static_pages#kids'

  get '/newin', to: 'static_pages#newin'
  
  get '/allItems', to: 'static_pages#allItems'
  
  get 'customers/new'

  get 'users/new'

  get 'items/new' 
  
  root 'static_pages#home'
  
  resources:items
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
