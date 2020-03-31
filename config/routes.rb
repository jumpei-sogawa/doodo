Rails.application.routes.draw do
  root 'pages#trend'
  get '/search' => 'pages#search'
  get '/mypage' => 'pages#mypage'

  resources :museums, only: [:index, :show]
  resources :exhibitions, only: [:index, :show] do
    resources :logs, only: [:new, :create]
  end
  resources :arts, only: [:show]

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update]
end
