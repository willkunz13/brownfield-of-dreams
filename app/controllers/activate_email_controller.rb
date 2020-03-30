class NotificationsController < ApplicationController
  def create
    @welcome = EmailGenerator.new
    email_info = {user: current_user,
                  message: @welcome.message
                 }
    NotifierMailer.inform(email_info).deliver_now
    flash[:notice] = "Thank you for sending a bit of advice."
    redirect_to dashboard_path
  end
end