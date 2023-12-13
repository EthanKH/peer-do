Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :tasks do
    post "ping_task", on: :member
  end

  resources :pings
  resources :friend_requests, only: [] do
    member do
      post "accept", to: "friend_requests#accept", as: :accept
      delete "reject", to: "friend_requests#reject", as: :reject
    end
  end
  get "users" => "users#index", as: :users
  get ":username" => "users#show", as: :user
  get ":username/my_tasks" => "users#my_tasks", as: :my_tasks
  get ":username/completed_tasks" => "users#completed_tasks", as: :completed_tasks

  # get ":username" => "tasks#index", as: :my_tasks

  get ":username/peer" => "users#peer", as: :peer
  get ":username/friends" => "users#friends", as: :user_friends
end
