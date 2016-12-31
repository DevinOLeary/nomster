class NotificationMailer < ActionMailer::Base
  default from: "no_reply@nomsterapp.com"

  def comment_added
    mail(to: "djodevtester@gmail.com",
        subject: "Someone commented on your place!")
  end
end
