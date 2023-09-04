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

      resources :customers
      resources :carries
      post '/store_input_data', to: 'customer#store_input_data'
    end
    patch '/two/update_all_limits', to: 'two/customers#update_all_limits', as: 'update_all_limits'




    #for numbers
    get '/two_numbers' => "two_numbers#show"


end
