Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/newevent', to: 'events#new'
  post '/newevent', to: 'events#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: [:new, :show, :create]
  resources :events, only: [:new, :show, :index, :create]
  resources :invitations, only: [:new, :create]
end
