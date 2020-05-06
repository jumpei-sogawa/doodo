Rails.application.routes.draw do
  root 'pages#home'
  get '/trend' => 'pages#trend'
  get '/search' => 'pages#search'

  resources :museums, only: [:index, :show]

  resources :logs, only: [:new, :create]

  resources :exhibitions, only: [:index, :show] do
    resources :exhb_pins, only: [:create, :destroy]
  end

  resources :arts, only: [:index, :show] do
    resources :art_logs, only: [:new, :create]
  end

  resources :articles

  resources :exhb_logs, only: [:show, :destroy] do
    resources :exhb_log_likes, only: [:create, :destroy]
    resources :exhb_log_comments, only: [:create]
  end

  get 'exhb_logs/:id/exhb_log_comments' => 'exhb_logs#show'

  resources :art_logs, only: [:show] do
    resources :art_log_likes, only: [:create, :destroy]
    resources :art_log_comments, only: [:create]
  end

  get 'art_logs/:id/art_log_comments' => 'art_logs#show'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  get '/mypage' => 'users#mypage'
  get '/:username' => 'users#show'
  get '/:username/edit' => 'users#edit'
  patch '/:username' => 'users#update'
end
