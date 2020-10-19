Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  resources :users, only: %i[show index]
  get '/following' => 'users#following'
  get '/followers' => 'users#followers'
  get 'pages/show'
  resources :tweets
  resources :relationships, only: %i[create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
