LikeApp::Application.routes.draw do

  devise_for :users

  resources :images, except: [:index, :create] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show, :create, :destroy] do
    resources :images, only: [:create]
  end
  resources :chat_rooms, only: [:new, :create, :show, :index]

  root 'categories#index'

  mount ActionCable.server => '/cable'

end
