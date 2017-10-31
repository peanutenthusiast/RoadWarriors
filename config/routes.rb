Rails.application.routes.draw do

  delete '/logout'  => 'sessions#destroy'

  namespace :api do

    post   '/login'   => 'sessions#create'
    get    '/verify'  => 'sessions#verify_access_token'

    resources :users, only: [:create, :show, :update, :destroy]

    resources :password_resets, only: [:create, :update]
    resources :yelp_restaurants, only: [:index]
  end


end
