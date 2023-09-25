class PasswordsController < ApplicationController 
  before_action :find_user

  def forget_password_email
    if @user 
      new_otp = @user.update(otp: rand.to_s[2..7] )
      if new_otp 
        UserMailer.with(user: @user).forget_password_email.deliver 
      else 
        rendor json: {message: "something went wrong"}
      end 
    end 
  end 

  def verify_otp
    otp = params[:otp]
    if @user && otp.to_i == @user.otp 
      token = jwt_encode(user_id: @user.id)
      render json: { message: "use this token to reset your password", token: token }
    else 
      render json: {message: "check your otp"}
    end
  end

  def reset_password 
    return unless @current_user == @user
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    if password == password_confirmation 
     
      if @current_user.update(password: password)
        render json: {message: "you updated the password"}
      else 
        render json: {message: "error in updating password"}
      end
    else 
      render json: {message: "password should match"}
    end
  end

  private

  def find_user 
    @user = User.find_by_email(params[:email])
  end
end
