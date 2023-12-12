Rails.application.routes.draw do

  root "home#index"
  
  devise_for :users

  resources :tasks
  resources :pings
  resources :friend_requests

  get "users" => "users#index", as: :users
  get ":username" => "users#show", as: :user
  get ":username/my_tasks" => "users#my_tasks", as: :my_tasks
  get ":username/completed_tasks" => "users#completed_tasks", as: :completed_tasks

  # get ":username" => "tasks#index", as: :my_tasks

  get ":username/peer" => "users#peer", as: :peer
  get ":username/friends" => "users#friends", as: :user_friends

end
