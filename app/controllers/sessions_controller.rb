# rubocop:todo Style/Documentation
# frozen_string_literal: true

class SessionsController < ApplicationController
  # rubocop:todo Naming/MemoizedInstanceVariableName
  def new
    @user ||= User.new
  end
  # rubocop:enable Naming/MemoizedInstanceVariableName

  def create # rubocop:todo Metrics/AbcSize
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
      flash[:sucess] = "Logged in as #{user.first_name}"
    else
      flash[:error] = 'Looks like your email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
# rubocop:enable Style/Documentation
