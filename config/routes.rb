Rails.application.routes.draw do
  root "home#index"
  
  devise_for :users

  resources :tasks



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get ":username" => "users#show", as: :user

end
