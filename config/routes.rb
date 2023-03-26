Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "sessions#new"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  #for session
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #for index
  get '/index' => 'two#index'

end
