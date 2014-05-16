Wikipages::Application.routes.draw do
  root :to => 'application#index'

  resources :contacts, :except => [:new, :edit]
  resources :phones
end



