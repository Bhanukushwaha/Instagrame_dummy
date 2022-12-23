Rails.application.routes.draw do
 
  devise_for :users
  get 'like' =>'posts#like', as: :like
  get 'unlike' =>'posts#unlike', as: :unlike
  get "/comment_delete/:id/:post_id", to: "comments#destroy"
  resources :posts do  
    resources :likes
    resources :comments
    resources :likes
    # resources :likes, only: [:create, :destroy] 
    # resources :comments, controller: 'posts/comment'
  end
     resources :pictures

  # get "/posts", to: "posts#index"
  root "posts#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
