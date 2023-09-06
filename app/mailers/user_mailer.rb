class UserMailer < ApplicationMailer
  def welcome_email
    default from: 'rishitap@shriffle.com'
    @user = params[:user]
    @url  = 'http://127.0.0.1:3000/users'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end 
end
