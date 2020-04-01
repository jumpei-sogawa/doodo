Rails.application.routes.draw do
  root 'pages#trend'
  get '/search' => 'pages#search'
  get '/mypage' => 'pages#mypage'

  resources :museums, only: [:index, :show]
  resources :exhibitions, only: [:index, :show] do
    resources :logs, only: [:new, :create]
    resources :exhb_clips, only: [:create, :destroy]
  end
  resources :arts, only: [:show]

  resources :exhb_logs, only: [:show] do
    resources :exhb_log_likes, only: [:create, :destroy]
    resources :exhb_log_comments, only: [:create]
  end

  resources :art_logs, only: [:show] do
    resources :art_log_likes, only: [:create, :destroy]
    resources :art_log_comments, only: [:create]
  end


  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update]
end
