class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000'
    mail(to: 'potatoes1229@yahoo.com', subject: "Bands for days!")
  end
end
