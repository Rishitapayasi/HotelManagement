class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
 
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
  attr_reader :current_user

  def not_found
    render json: {error: 'Record not found'}, status:404
  end
end
