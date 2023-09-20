class UsersController < ApplicationController
  # skip_before_action :authenticate_request, only: [:index, :create, :login, :reset_password]
  before_action :authenticate_user!
  def index 
    @user = User.all
    redirect_to @user
  end

  def show
    render json:  @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver
      render json: @user, serializer: UserSerializer
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @current_user.update(user_params)
      render json: { message: 'User updated', data: @current_user }
    else
      error_msg
    end
  end

  def destroy
    if @current_user.destroy
      render json: { message: 'User deleted' }
    else
      error_msg
    end
  end

  # def login
  #   @user = User.find_by_email(params[:email])
  #   # debugger
  #   if @user&.authenticate(params[:password])
  #     token = jwt_encode(user_id: @user.id)
  #     render json: { message: "Logged In Successfully!!", token: token }
  #   else
  #     render json: { error: "Please Check your Email And Password"}  
  #   end
  # end 

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :type)
  end 

  def error_msg 
    render json: { errors: @current_user.errors.full_messages }
  end
end
