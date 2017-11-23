Rails.application.routes.draw do

  delete '/logout'  => 'sessions#destroy'

  namespace :api do

    post   '/login'   => 'sessions#create'
    get    '/verify'  => 'sessions#verify_access_token'
    get    '/restaurants' => 'yelp_restaurants#index'
    get    '/gas_stations' => 'gas_stations#index'
    resources :users, only: [:create, :show, :update, :destroy]

    resources :password_resets, only: [:create, :update]
  end


end
