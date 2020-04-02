# rubocop:todo Style/Documentation
# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::BaseController < ApplicationController
  before_action :require_admin!

  def require_admin!
    four_oh_four unless current_user.admin?
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/ClassAndModuleChildren
