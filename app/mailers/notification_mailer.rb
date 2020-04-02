# frozen_string_literal: true

class NotificationMailer < ApplicationMailer # rubocop:todo Style/Documentation
  def new_notification_email(user)
    @user = user
    mail(to: user.email, subject: 'you got mail!')
  end
end
