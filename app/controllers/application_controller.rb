class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ActionView::Layouts
 
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from CanCan::AccessDenied, with: :AccessDenied


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :type])
  end

  def not_found
    render json: {error: 'Record not found'}, status:404
  end 

  def AccessDenied 
    render json: {error: "you are not authorised to perform this action"}
  end
end
