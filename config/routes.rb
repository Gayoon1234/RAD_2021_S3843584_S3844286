Rails.application.routes.draw do
  
  
  
  #devise_for :users
  
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 
  
  resources :saves
  get '/home', to: 'static_pages#home'

  get '/mens', to: 'static_pages#mens'

  get '/womens', to: 'static_pages#womens'

  get '/kids', to: 'static_pages#kids'

  get '/newin', to: 'static_pages#newin'
  
  get '/popular', to: 'static_pages#popular'
  
  get '/allItems', to: 'static_pages#allItems'
  
  get 'filter/:section', to: "static_pages#filter"
  
  get '/saves/new/:id', to: 'saves#new'
  
  get '/saves/remove/:id', to: 'saves#remove'
  
  get 'customers/new'

  get 'users/new'

  get 'items/new' 
  
  get 'home/newsletter', to: 'static_pages#home'
  
  get 'carts/show'

  get 'carts/show/:checkout', to: "carts#show"
  
  get 'carts/edit'
  
  get 'carts/remove'
  
  get 'carts/new/:id', to: "carts#new"
  
  get 'carts/add'
  
  root 'static_pages#home'
  
  resources:items
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
