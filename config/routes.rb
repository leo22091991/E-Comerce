Rails.application.routes.draw do
  root 'welcome#cart'
  patch '/carts' => 'carts#update'

  resources :carts
  resources :line_items
  resources :sales
  resources :categories
  resources :products do
  	resources :categories, only: [:show]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
