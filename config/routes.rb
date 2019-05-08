Rails.application.routes.draw do
  resources :welcome
  root 'welcome#cart'
  post '/sales' => 'sales#create'
  patch '/carts' => 'carts#update'
  patch '/line_items/update_add_quantity' => 'line_items#update_add_quantity'
  patch '/line_items/update_rec_quantity' => 'line_items#update_rec_quantity'
  delete '/carts' => 'carts#delete_item'

  resources :carts
  resources :line_items
  resources :sales  
  resources :categories
  resources :products do
  	resources :categories, only: [:show]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
