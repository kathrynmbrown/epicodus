ReviewStore::Application.routes.draw do

  devise_for :users
  resources :products
  resources :reviews
  resources :profiles
  root to: 'products#home'
end
