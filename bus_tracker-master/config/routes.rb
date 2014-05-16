BusStop::Application.routes.draw do
  root :to => 'main#index'

  resources :lines

  resources :stations

  resources :main
end
