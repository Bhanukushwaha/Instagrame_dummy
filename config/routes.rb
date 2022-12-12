Rails.application.routes.draw do
  devise_for :users
  resources :posts
  # get "/posts", to: "posts#index"
  resources :pictures
  root "pictures#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
