class NotificationsController < ApplicationController
  def create
    email_info = {user: current_user
                 }
    NotifierMailer.inform(email_info).deliver_now
    flash[:notice] = "Email was sent to your email."
    redirect_to dashboard_path
  end
end