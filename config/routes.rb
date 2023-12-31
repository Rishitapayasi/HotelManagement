Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) 

  devise_for :users

  root to: "hotels#index"
  resources :bookings 
  # resources:users
  # get '/index', to: 'users#index'
  # post 'user/login', to: 'users#login'
  # patch 'users', to: 'users#update'
  # put 'users', to: 'users#update'
  # delete 'users', to: 'users#destroy'
  resources :hotels 
  resources :rooms
  
  get '/available_hotels', to: 'customers#available_hotels'
  
  
  post '/forget_password', to: 'passwords#forget_password_email'
  post '/reset_password', to: 'passwords#reset_password'
  post '/verify_otp', to: 'passwords#verify_otp'
end
