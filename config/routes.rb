Rails.application.routes.draw do
  root 'pages#trend'
  get '/search' => 'pages#search'
  get '/mypage' => 'pages#mypage'

  resources :museums, only: [:index, :show]
  resources :exhibitions, only: [:index, :show] do
    resources :logs, only: [:new, :create]
    resources :exhb_logs, only: [:create]
  end
  resources :arts, only: [:show] do
    resources :art_logs, only: [:create]
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  get '/users/:id' => 'users#show'

end
