class NotificationMailer < ApplicationMailer
  def new_notification_email(user)
    @user = user
    mail(to: user.email, subject: "you got mail!")
  end
end
