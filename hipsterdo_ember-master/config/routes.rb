HipsterDo::Application.routes.draw do
  root :to => 'application#index'
  resources :lists, :except => [:new, :edit]
  resources :tasks, :except => [:new, :edit]
end
