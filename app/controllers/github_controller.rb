class GithubController < ApplicationController
  def connect_user
    client_id     = "0d188ebb72526258a36b"
    client_secret = "b8ebdfd497df7016340f3f14d22ecbcd7a43ff26"
    code          = params[:code]
    response      = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")

    pairs = response.body.split("&")
    response_hash = {}
    pairs.each do |pair|
      key, value = pair.split("=")
      response_hash[key] = value
    end

    token = response_hash["access_token"]

    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")

    auth = JSON.parse(oauth_response.body)
    
    user          = User.find(current_user.id)
    user.username = auth["login"]
    user.uid      = auth["id"]
    user.token    = token
    
    session[:user_id] = user.id

    redirect_to "/dashboard"
  end
end
