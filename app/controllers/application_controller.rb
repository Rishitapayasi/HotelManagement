class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request
  # before_action :check_owner
  # before_action :check_customer
  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  def authenticate_request
		begin
			header = request.headers[ 'Authorization' ]
			header = header.split(" ").last if header
			decoded = jwt_decode(header)
			@current_user = User.find(decoded[:user_id])
		rescue JWT::DecodeError	=> e
			render json: { error: 'Invalid token' }, status: :unprocessable_entity
		end  
  end 

  # def check_owner
  #   render json: { message: 'You are not owner' } unless @current_user.type == 'Owner'
  # end

  # def check_customer
  #   render json: { message: 'You are not customer' } unless @current_user.type == 'Customer'
  # end
end
