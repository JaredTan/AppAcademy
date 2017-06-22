class UserMailer < ActionMailer::Base
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/session/new'
    mail(to: 'lol@example.com', subject: 'Welcome to the cat land!')
  end
end
