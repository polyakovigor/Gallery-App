LikeApp::Application.routes.draw do

  devise_for :users

  resources :images do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :comments, only: [:index]

  resources :categories, only: [:index, :show, :create, :destroy] do
    resources :images, only: [:create]
  end

  resources :chat_rooms, only: [:new, :create, :show, :index]

  resources :events, only: [:index] do
    collection do
      get :navigation
      get :user_sign_in
      get :user_sign_out
      get :user_likes
      get :user_comments
    end
  end

  root 'categories#index'

  mount ActionCable.server => '/cable'

end
