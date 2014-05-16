Stayaway::Application.routes.draw do
  root to: 'places#index'

  devise_for :users
  resources :places
  resources :reviews
end
