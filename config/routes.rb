Rails.application.routes.draw do
  root 'chefs#index'
  get '/help' => 'user_stories#index'

  delete '/logout' => 'sessions#destroy'

  resources :chefs
  resources :users
  resources :sessions
  resources :menus
  resources :bookings


end
