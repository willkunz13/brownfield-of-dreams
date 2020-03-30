class NotifierMailer < ApplicationMailer
  def inform(info)
    @user = info[:user]
    @message = info[:message]

    mail(to: @user.email, subject: "#{@user} is one email")
  end
end