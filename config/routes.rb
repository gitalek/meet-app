Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root 'events#index'

  resources :events

  resources :users, only: %i[show edit]
end
