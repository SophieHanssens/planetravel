Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  ressources :planets do
    ressources :bookings, only: [:new, :create]
    patch '/bookiongs/:id', to: 'bookings#accept'
    patch '/bookiongs/:id', to: 'bookings#reject'
  end
  ressources :bookings, only: :destroy
  get '/', to: 'pages#home'
  get '/about', to: 'pages#about'
end
