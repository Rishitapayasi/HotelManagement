Rails.application.routes.draw do
  resource :customers
  resources :bookings
  resource :users
  post 'user/login', to: 'users#login'
  # patch 'users', to: 'users#update'
  # put 'users', to: 'users#update'
  # delete 'users', to: 'users#destroy'
  resources :hotels
  post '/room/create', to: 'rooms#create'
  get '/open_hotel', to: 'customers#open_hotel'
  
  resource :owner
  get '/user_hotel', to: 'owners#user_hotel'
  
end
