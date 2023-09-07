class UserMailer < ApplicationMailer
  default from: 'rishitap@shriffle.com'
  # default 'mailer'
  def welcome_email
    @user = params[:user]
    # @url  = 'http://127.0.0.1:3000/users'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end 
end
