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
      redirect_to dashboard_path
      
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: @user).welcome_email.deliver_later
 
        # format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @user.errors, status: :unprocessable_entity }
      # end
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
