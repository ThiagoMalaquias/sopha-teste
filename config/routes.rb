Rails.application.routes.draw do
  resources :users

  root "home#index"

  get "/singin", to: "login#sign_in"
  post "/singin", to: "login#sign_in"

  get "/signup", to: "login#new"
  post "/signup", to: "login#sign_up"

  get "/exit", to: "login#exit"
end
