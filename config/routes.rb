Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, except: [:new, :show, :destroy, :index]
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show', as: 'profile'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :npos
  get '/npoform', to: 'npos#new'
  get '/npo/:id', to: 'npos#show', as: 'npoprofile'
   
end

#    Prefix Verb   URI Pattern               Controller#Action
#       root GET    /                         welcome#index
#      users POST   /users(.:format)          users#create
#  edit_user GET    /users/:id/edit(.:format) users#edit
#       user PATCH  /users/:id(.:format)      users#update
#            PUT    /users/:id(.:format)      users#update
#     signup GET    /signup(.:format)         users#new
#    profile GET    /users/:id(.:format)      users#show
#   sessions POST   /sessions(.:format)       sessions#create
#      login GET    /login(.:format)          sessions#new
#     logout GET    /logout(.:format)         sessions#destroy
#       npos GET    /npos(.:format)           npos#index
#            POST   /npos(.:format)           npos#create
#    new_npo GET    /npos/new(.:format)       npos#new
#   edit_npo GET    /npos/:id/edit(.:format)  npos#edit
#        npo GET    /npos/:id(.:format)       npos#show
#            PATCH  /npos/:id(.:format)       npos#update
#            PUT    /npos/:id(.:format)       npos#update
#            DELETE /npos/:id(.:format)       npos#destroy
#    npoform GET    /npoform(.:format)        npos#new
# npoprofile GET    /npo/:id(.:format)        npos#show