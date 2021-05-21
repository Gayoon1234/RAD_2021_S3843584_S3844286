Rails.application.routes.draw do
  
  get 'carts/show'

  get 'carts/show/:checkout', to: "carts#show"
  
  get 'carts/edit'
  
  get 'carts/remove'
  
  get 'carts/new/:id', to: "carts#new"
  
  get 'carts/add'
  
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :saves
  get '/home', to: 'static_pages#home'

  get '/mens', to: 'static_pages#mens'

  get '/womens', to: 'static_pages#womens'

  get '/kids', to: 'static_pages#kids'

  get '/newin', to: 'static_pages#newin'
  
  get '/allItems', to: 'static_pages#allItems'
  
  get '/saves/new/:id', to: 'saves#new'
  
  get '/saves/remove/:id', to: 'saves#remove'
  
  get 'customers/new'

  get 'users/new'

  get 'items/new' 
  
  get 'home/newsletter', to: 'static_pages#home'
  
  root 'static_pages#home'
  
  resources:items
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
