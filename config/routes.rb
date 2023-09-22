Rails.application.routes.draw do
  # devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) 

  devise_for :users

  resources :bookings
  resources:users
  # get '/index', to: 'users#index'
  # post 'user/login', to: 'users#login'
  # patch 'users', to: 'users#update'
  # put 'users', to: 'users#update'
  # delete 'users', to: 'users#destroy'
  resources :hotels
  post '/room/create', to: 'rooms#create'
  get '/my_hotel', to: 'owners#my_hotel'
  get '/available_hotels', to: 'customers#available_hotels'
  get '/my_booking', to: 'bookings#my_booking'
  get '/my_hotel',to: 'hotels#my_hotels'
  post '/forget_password', to: 'passwords#forget_password_email'
  post '/reset_password', to: 'passwords#reset_password'
  post '/verify_otp', to: 'passwords#verify_otp'
end
