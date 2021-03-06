# rubocop:todo Style/Documentation
# frozen_string_literal: true

class ActivateController < ApplicationController
  def show; end

  def update
    user = User.find(params[:id])
    user.status = 'active'
    user.save
    redirect_to users_activated_path
  end
end
# rubocop:enable Style/Documentation
