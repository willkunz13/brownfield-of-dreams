# frozen_string_literal: true

class AdminDashboardFacade # rubocop:todo Style/Documentation
  def tutorials
    Tutorial.all
  end
end
