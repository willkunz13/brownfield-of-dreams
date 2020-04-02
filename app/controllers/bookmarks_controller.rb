# rubocop:todo Style/Documentation
# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    flash[:notice] = 'User must login to bookmark videos.'
    redirect_back(fallback_location: '/')
  end
end
# rubocop:enable Style/Documentation
