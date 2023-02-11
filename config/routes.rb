Rails.application.routes.draw do
 
  devise_for :users
  get 'like' =>'posts#like', as: :like
  get 'unlike' =>'posts#unlike', as: :unlike
  delete "/comments/:id", to: "comments#destroy"
  get 'follow/:following_id' => 'users#follow' , as: :follow
  get 'unfollow/:following_id' => 'users#unfollow', as: :unfollow


  resources :posts do  
    resources :likes
    resources :comments
  end
   resources :pictures
   get 'profile' => 'users#profile', as: :profile
   get 'users' => 'users#index', as: :users
   get "/users/:id" => "users#show", as: :user
  # get "/posts", to: "posts#index"
  root "posts#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
