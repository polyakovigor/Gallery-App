LikeApp::Application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :images, expect: [:new, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end

  resources :comments, only: [:index]

  resources :categories do
    resources :images, only: [:new, :create, :destroy]
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