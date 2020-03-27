class GithubController < ApplicationController
  def create
	response = request.env["omniauth.auth"]
	current_user.token = response["credentials"]["token"]
	current_user.uid = response["uid"]
	current_user.username = response["extra"]["raw_info"]["login"]
	current_user.save
	binding.pry
	redirect_to "/dashboard"
  end
end
