Rails.application.routes.draw do
  get 'users/following'
  get 'users/followers'
  resources :users, only: :show
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  resources :tweets
  resources :relationships, only: %i[create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
