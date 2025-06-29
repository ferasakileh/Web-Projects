Rails.application.routes.draw do
  get 'users/new'

  root "sessions#new"

  get "/home", to: "static_pages#home", as: 'home'
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"

  get "/users/new", to: "users#new", as: 'new_user'
  get "/show", to: "users#show"
  get "/users/:id", to: "users#show", as: 'user'
  get "/users", to: "users#index"
  post "/users", to: "users#create"

  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  # resources :events do
  #   resources :presentations
  # end 
  resources :events
  resources :presentations
  resources :evaluations

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # #presentation routes
  # resources :presentations
  
  # # routes for presentation
  # resources :presentations do
  #   resources :evaluations, only: [:new, :create]

end