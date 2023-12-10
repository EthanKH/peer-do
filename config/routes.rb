Rails.application.routes.draw do

  root "home#index"
  
  devise_for :users

  resources :tasks
  resources :pings
  resources :friend_requests

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get ":username" => "users#show", as: :user
  get ":username" => "tasks#index", as: :my_tasks

  get ":username/peer" => "users#peer", as: :peer
  get ":username/receiver" => "users#receiver", as: :receiver

end
