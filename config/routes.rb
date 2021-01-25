Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"
  #get "todos/:id", to: "todos#show"
  post "users/login", to: "users#show"
  delete "users/delete", to: "users#destroy"
  patch "users/change-password", to: "users#update"

  get "/" => "home#index"
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create", as: :sessions


  resources :todos
  resources :users

end
