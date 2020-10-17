Rails.application.routes.draw do
  get 'users/following'
  get 'users/followers'
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
