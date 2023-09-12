class PasswordsController < ApplicationController 
  skip_before_action :authenticate_request, except: [:reset_password] 
  skip_before_action :check_owner
  skip_before_action :check_customer

  def forget_password_email
    @user = User.find_by_email(params[:email])
      if @user 
        @otp = rand.to_s[2..7] 
        new_otp = @user.update(otp: @otp)
        if new_otp 
          UserMailer.with(user: @user).forget_password_email.deliver 
        else 
          rendor json: {message: "something went wrong"}
        end 
      else 
        render json: {message: "no user found"}, status: :not_found
      end 
  end 

  def verify_otp
    @user = User.find_by_email(params[:email])
    otp = params[:otp]
    if otp.to_i == @user.otp 
      token = jwt_encode(user_id: @user.id)
      render json: { message: "use this token to reset your password", token: token }
    else 
      render json: {message: "check your otp"}
    end
  end

  def reset_password 
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    
    if password == password_confirmation 
     
      if @current_user.update(password: password, password_confirmation: password_confirmation)
        render json: {message: "you updated the password"}
      else 
        render json: {message: "error in updating password"}
      end
    else 
      render json: {message: "password should match"}
    end
  end
end
