class UserMailer < ApplicationMailer
    default from:ENV['EMAIL_USERNAME']
  
    def password_reset(user)
      @user = user
      mail(to: @user.email, subject: "Password Reset Instructions")
    end
  end
  