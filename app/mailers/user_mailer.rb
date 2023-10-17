class UserMailer < ApplicationMailer
  def send_new_user_message(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Our App')
  end
end
