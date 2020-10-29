class ApplicationMailer < ActionMailer::Base
  default from: 'edurand.viel@gmail.com'
  layout 'mailer'
end

# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'edurand.viel@gmail.com'

  def wellcome_mail
    @user = params[:user]
    @url = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
