Rails.application.routes.draw do
  root 'top#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  get 'user_policy', to: 'top#user_policy'
  get 'privacy_policy', to: 'top#privacy_policy'

  resources :users, only: %i[new create show], param: :uuid
  resources :categories, only: %i[index show], param: :name
  resources :items, only: %i[show]
  resources :posts do
    resources :post_images, only: %i[create]
    resources :comments, only: %i[create update destroy], shallow: true
    resources :likes, only: %i[create destroy], shallow: true
    get 'likes', on: :collection
    resources :bookmarks, only: %i[create destroy], shallow: true
    get 'bookmarks', on: :collection
  end

  scope module: 'api/v1' do
    get 'search', to: 'items#search'
  end

  resource :profile, only: %i[edit update]

  # 管理者用
  namespace :admin do
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    root 'dashboards#index'
    resources :users, only: %i[index show edit update destroy], shallow: true
    resources :items, shallow: true
    resources :posts, only: %i[index show destroy], shallow: true
  end
end
