Rails.application.routes.draw do
  root 'top#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  resources :users, only: %i[new create]
  resources :categories, only: %i[index show], param: :name
  resources :posts do
    resources :post_images, only: %i[create]
    resources :comments, only: %i[create update destroy], shallow: true
    resources :likes, only: %i[create destroy], shallow: true
    get 'likes', on: :collection
    resources :bookmarks, only: %i[create destroy], shallow: true
    get 'bookmarks', on: :collection
  end
  
  resource :profile, only: %i[edit update]
end
