# frozen_string_literal: true

class NotifierMailer < ApplicationMailer # rubocop:todo Style/Documentation
  def inform(info)
    @user = info[:user]
    @message = info[:message]

    mail(to: @user.email, subject: "#{@user} is one email")
  end
end
