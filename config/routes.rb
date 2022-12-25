Rails.application.routes.draw do
  post 'desired_planets/create', to: 'desired_planets#create', as: 'desired_planets_create'
  post 'desired_planets/destroy', to: 'desired_planets#destroy'
  get 'sessions/new'
  post 'sessions/create', to: 'sessions#create'
  post 'sessions/destroy', to: 'sessions#destroy'
  root 'planets#index', as: 'home'
  get 'planets/new'
  post 'planets/create', to: 'planets#create'
  post 'planets/destroyy', to: 'planets#destroyy'
  get 'users/new'
  get 'users/secret'
  post 'users/create', to: 'users#create'
  get 'users/profile_page'
  get 'planets/:id', to: 'planets#show', as: 'planet_show'
  resources :sessions
  resources :planets
end
