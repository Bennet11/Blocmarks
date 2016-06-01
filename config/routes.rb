Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  get 'welcome', to: 'welcome#index'

  get 'about', to: 'welcome#about'

  authenticated :user do
    root 'topics#index', as: :authenticated_root
  end

  post :incoming, to: 'incoming#create'
  
  root 'welcome#index'
end
