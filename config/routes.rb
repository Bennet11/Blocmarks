Rails.application.routes.draw do

  get 'comments/new'

  devise_for :users
  
  resources :topics do
    resources :bookmarks, except: [:index]
    resources :comments
  end

  get 'welcome', to: 'welcome#index'

  get 'about', to: 'welcome#about'

  authenticated :user do
    root 'topics#index', as: :authenticated_root
  end

  root 'welcome#index'
end
