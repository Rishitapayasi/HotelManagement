Rails.application.routes.draw do
  
  resources :bookings
  resource :users
  post 'user/login', to: 'users#login'
  # patch 'users', to: 'users#update'
  # put 'users', to: 'users#update'
  # delete 'users', to: 'users#destroy'
  resources :hotels
  post '/room/create', to: 'rooms#create'
  get '/my_hotel', to: 'owners#my_hotel'
  get '/available_hotel', to: 'customers#available_hotel'
  get '/my_booking', to: 'bookings#my_booking'
 
  post '/forget_password', to: 'passwords#forget_password_email'
  post '/reset_password', to: 'passwords#reset_password'
  post '/verify_otp', to: 'passwords#verify_otp'
end
