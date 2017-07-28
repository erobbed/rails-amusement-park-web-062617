Rails.application.routes.draw do

root 'users#index', as: 'home'
get '/users/new', to: 'users#new', as: 'signup'
post '/users', to: 'users#create'
get '/users/:id', to: 'users#show', as: 'user'
get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
patch '/users/:id', to: 'users#update'
get '/attractions', to: 'attractions#index', as: 'attractions'
get '/attractions/new', to: 'attractions#new', as: 'new_attraction'
post '/attractions', to: 'attractions#create'
get '/attractions/:id', to: 'attractions#show', as: 'attraction'
get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
patch '/attractions/:id', to: 'attractions#update'
get '/signin', to: 'sessions#new', as: 'login'
post '/sessions', to: 'sessions#create'
delete '/signout', to: 'sessions#destroy', as: 'logout'
post '/rides', to: 'rides#new'


end
