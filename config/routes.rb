LikeApp::Application.routes.draw do

  devise_for :users

  resources :images do
    resources :comments
    resources :likes
  end

  resources :comments, only: [:index]

  resources :categories, only: [:index, :show, :create, :destroy] do
    resources :images, only: [:create]
  end

  resources :chat_rooms, only: [:new, :create, :show, :index]

  resources :events

  match '/navigation',    to: 'events#navigation',    via: 'get'
  match '/user_sign_in',  to: 'events#user_sign_in',  via: 'get'
  match '/user_sign_out', to: 'events#user_sign_out', via: 'get'
  match '/user_likes',    to: 'events#user_likes',    via: 'get'
  match '/user_comments', to: 'events#user_comments', via: 'get'

  root 'categories#index'

  mount ActionCable.server => '/cable'

end
