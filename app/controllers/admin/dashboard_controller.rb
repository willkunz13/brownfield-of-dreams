# rubocop:todo Style/Documentation
# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::DashboardController < Admin::BaseController
  def show
    @facade = AdminDashboardFacade.new
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/ClassAndModuleChildren
