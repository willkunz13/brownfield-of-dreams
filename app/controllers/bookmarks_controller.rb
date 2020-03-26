class BookmarksController < ApplicationController
  def create
	flash[:notice] = 'User must login to bookmark videos.'
	redirect_back(fallback_location: '/')
  end
end
