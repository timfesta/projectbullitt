Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, except: [:new, :show, :destroy, :index]
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show', as: 'profile'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :npos do 
    resources :tasks
  end
  get '/npoform', to: 'npos#new'

  # resources :tasks use this later for task functionality

  resources :projects, only: [:new, :create, :show]
end


#        Prefix Verb   URI Pattern                            Controller#Action
#          root GET    /                                      welcome#index
#         users POST   /users(.:format)                       users#create
#     edit_user GET    /users/:id/edit(.:format)              users#edit
#          user PATCH  /users/:id(.:format)                   users#update
#               PUT    /users/:id(.:format)                   users#update
#        signup GET    /signup(.:format)                      users#new
#       profile GET    /users/:id(.:format)                   users#show
#      sessions POST   /sessions(.:format)                    sessions#create
#         login GET    /login(.:format)                       sessions#new
#        logout GET    /logout(.:format)                      sessions#destroy
#     npo_tasks GET    /npos/:npo_id/tasks(.:format)          tasks#index
#               POST   /npos/:npo_id/tasks(.:format)          tasks#create
#  new_npo_task GET    /npos/:npo_id/tasks/new(.:format)      tasks#new
# edit_npo_task GET    /npos/:npo_id/tasks/:id/edit(.:format) tasks#edit
#      npo_task GET    /npos/:npo_id/tasks/:id(.:format)      tasks#show
#               PATCH  /npos/:npo_id/tasks/:id(.:format)      tasks#update
#               PUT    /npos/:npo_id/tasks/:id(.:format)      tasks#update
#               DELETE /npos/:npo_id/tasks/:id(.:format)      tasks#destroy
#          npos GET    /npos(.:format)                        npos#index
#               POST   /npos(.:format)                        npos#create
#       new_npo GET    /npos/new(.:format)                    npos#new
#      edit_npo GET    /npos/:id/edit(.:format)               npos#edit
#           npo GET    /npos/:id(.:format)                    npos#show
#               PATCH  /npos/:id(.:format)                    npos#update
#               PUT    /npos/:id(.:format)                    npos#update
#               DELETE /npos/:id(.:format)                    npos#destroy
#       npoform GET    /npoform(.:format)                     npos#new
#      projects POST   /projects(.:format)                    projects#create
#   new_project GET    /projects/new(.:format)                projects#new
#       project GET    /projects/:id(.:format)                projects#show