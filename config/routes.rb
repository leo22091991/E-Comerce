Rails.application.routes.draw do
  resources :carts
  get 'welcome/index'
  root 'welcome#cart'

  resources :sales
  resources :categories
  resources :products do
  	resources :categories, only: [:show]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
