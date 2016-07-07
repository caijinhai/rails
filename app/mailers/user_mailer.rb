
class UserMailer < ActionMailer::Base
  default from: "cjh123honey@gmail.com"
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome')
  end
end