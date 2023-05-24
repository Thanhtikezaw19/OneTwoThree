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

  #for two index
  get 'two/index' => 'two#index'

  get 'two/update_table', to: 'two#update_table'

  #for customer

    namespace :two do

      resources :customers, only: [:new, :create]
    end
    # get '/create_customers', to: 'two/customers#new'
    # post '/create_customers', to: 'two/customers#create'
    # get 'two/create_customers' => 'two/customers#new', as: :new_two_customers
    # post 'two/create_customers' => 'two/customers#create', as: :create_two_customers


  #for numbers
    get '/two_numbers' => "two_numbers#show"

end
