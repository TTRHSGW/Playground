Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show index]
  resources :tweets, only: %i[create destroy]
  root 'pages#home'
  get 'pages/mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
