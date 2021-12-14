Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :planets do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: :destroy do
    member do
      patch 'accept'
      patch 'reject'
    end
  end
  get '/', to: 'pages#home'
  get '/about', to: 'pages#about'
end
