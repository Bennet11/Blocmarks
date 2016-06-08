Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show]

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks do
    resources :likes, only: [:index, :create, :destroy]
  end

  authenticated :user do
    root 'topics#index', as: :authenticated_root
  end

  post :incoming, to: 'incoming#create'

  root 'welcome#index'

  get 'users/show'

  get 'likes/index'

  get 'welcome', to: 'welcome#index'

  get 'about', to: 'welcome#about'

end
