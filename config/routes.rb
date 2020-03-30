Rails.application.routes.draw do
  root 'pages#trend'
  get '/search' => 'pages#search'
  get '/mypage' => 'pages#mypage'

  resources :exhibitions, only: [:index, :show]
  resources :arts, only: [:show]
  resources :logs, only: [:new, :create]

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  get '/users/:id' => 'users#show'

end
