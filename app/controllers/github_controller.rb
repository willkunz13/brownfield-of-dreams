# rubocop:todo Style/Documentation
# frozen_string_literal: true

class GithubController < ApplicationController
  def create # rubocop:todo Metrics/AbcSize
    response = request.env['omniauth.auth']
    current_user.token = response['credentials']['token']
    current_user.uid = response['uid']
    current_user.username = response['extra']['raw_info']['login']
    current_user.save
    redirect_to '/dashboard'
  end
end
# rubocop:enable Style/Documentation
