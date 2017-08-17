Rails.application.routes.draw do
root :to => 'users#home'
get 'users/new', to: 'users#new'
get 'users/:id', to: 'users#show', as: 'user'
get '/users', to: 'users#index', as: 'users'
post '/users', to: 'users#create'
get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create', as: 'submit'
delete '/users/:id', to: 'sessions#destroy', as: 'logout'
get '/attractions', to: 'attractions#index'
get '/attractions/:id', to: 'attractions#show', as: 'attraction'
post '/rides', to: 'rides#create'

end
