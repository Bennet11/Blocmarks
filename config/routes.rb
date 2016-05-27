Rails.application.routes.draw do

  devise_for :users
  
  resources :topics do
    resources :bookmarks, except: [:index]
  end

  get 'welcome', to: 'welcome#index'

  get 'about', to: 'welcome#about'

  root 'welcome#index'
end
