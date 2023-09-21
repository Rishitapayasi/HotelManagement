class ApplicationController < ActionController::Base
  # include JsonWebToken
  include ActionView::Layouts
  # before_action :authenticate_request
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from CanCan::AccessDenied, with: :AccessDenied
  # def authenticate_request
	# 	begin
	# 		header = request.headers[ 'Authorization' ]
	# 		header = header.split(" ").last if header
	# 		decoded = jwt_decode(header)
	# 		@current_user = User.find(decoded[:user_id])
	# 	rescue JWT::DecodeError	=> e
	# 		render json: { error: 'Invalid token' }, status: :unprocessable_entity
	# 	end  
  # end 
  #  before_action :current_user

  def not_found
    render json: {error: 'Record not found'}, status:404
  end 
  def AccessDenied 
    render json: {error: "you are not authorised to perform this action"}
  end
end
