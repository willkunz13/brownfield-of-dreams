class UsersController < ApplicationController
  def show
    render locals: {
      dash: DashboardFacade.new(current_user)
    }
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      NotificationMailer.new_notification_email(user).deliver_now
      flash[:success] = "Email has been sent to #{user.first_name}'s' email."
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      redirect_back(fallback_location: "/register")
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
