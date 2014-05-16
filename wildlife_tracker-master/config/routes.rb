WildlifeTracker::Application.routes.draw do
  match('species/:id', {:via => :get, :to => 'species#show'})
  match('species', {:via => :get, :to => 'species#index'})
  match('regions/select', {:via => :post, :to => 'regions#region_select'})
  match('regions', {:via => :get, :to => 'regions#index'})
  match('sightings/create', {:via => :post, :to => 'sightings#new_sighting'})
  match('sightings', {:via => :post, :to => 'sightings#index'})
  match('/', {:via => :get, :to => 'main#index'})
end
