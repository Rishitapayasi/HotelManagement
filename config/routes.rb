Rails.application.routes.draw do
  
  resources :bookings
  resource :users
  post 'user/login', to: 'users#login'
  # patch 'users', to: 'users#update'
  # put 'users', to: 'users#update'
  # delete 'users', to: 'users#destroy'
  resources :hotels
  post '/room/create', to: 'rooms#create'
  get '/user_hotel', to: 'owners#user_hotel'
  get '/index', to: 'customers#index'
   
 
  post '/forget_password', to: 'passwords#forget_password_email'
  post '/reset_password', to: 'passwords#reset_password'
  post '/verify_otp', to: 'passwords#verify_otp'
end
