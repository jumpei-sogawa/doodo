Rails.application.routes.draw do
  root 'pages#trend'
  get '/search' => 'pages#search'
  get '/mypage' => 'pages#mypage'
  get '/users/:id' => 'users#show'

  resources :exhibitions, only: [:index, :show]
  resources :arts, only: [:show]
  resources :logs, only: [:new, :create]

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
end
