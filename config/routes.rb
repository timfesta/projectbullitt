Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, except: [:new, :show, :destroy, :index]
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show', as: 'profile'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'


end
