Rails.application.routes.draw do
  # get 'shop_menus/index'
  # get 'shops/index'
  # get 'orders/index'
  # get 'menus/index'
  # get 'order_menus/index'
  # get 'users/index'

  root "sessions#new"
  resources :users 
  resources :menus
  resources :orders
  resources :shops
  resources :shop_menus
  resources :sessions
  resources :order_menus
  
  delete "logout", to: "sessions#logout"
 
end
