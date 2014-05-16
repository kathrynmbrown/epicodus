Carbtracker::Application.routes.draw do
 match('/', {via: :get, to: 'main#index'})

 match('foods', {:via => :get, :to => 'foods#index'})
 match('foods/new', {:via => :get, :to => 'foods#new'})
 match('foods', {:via => :post, :to => 'foods#create'})
 match('foods/:id', {:via => :get, :to => 'foods#show'})
 match('foods/:id/edit', {:via => :get, :to => 'foods#edit'})
 match('foods/:id', {:via => [:patch, :put], :to => 'foods#update'})
 match('foods/:id', {:via => :delete, :to => 'foods#destroy'})

 match('meals', {:via => :get, :to => 'meals#index'})
 match('meals/new', {:via => :get, :to => 'meals#new'})
 match('meals', {:via => :post, :to => 'meals#create'})
 match('meals/:id', {:via => :get, :to => 'meals#show'})
 match('meals/:id/edit', {:via => :get, :to => 'meals#edit'})
 match('meals/:id', {:via => [:patch, :put], :to => 'meals#update'})
 match('meals/:id', {:via => :delete, :to => 'meals#destroy'})
end
