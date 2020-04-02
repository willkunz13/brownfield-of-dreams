# frozen_string_literal: true

class DashboardFacade # rubocop:todo Style/Documentation
  def initialize(current_user)
    @current_user = current_user
  end

  def generate_repo
    service = GithubService.new(@current_user)
    service.repo_list.map do |repo|
      Repo.new(repo)
    end
  end

  def generate_followers
    service = GithubService.new(@current_user)
    service.follower_list.map do |follower|
      Follower.new(follower)
    end
  end

  def generate_followings
    service = GithubService.new(@current_user)
    service.following_list.map do |followee|
      Followee.new(followee)
    end
  end

  def friends
    User.find(@current_user.id).preys
  end

  def bookmarks
    User.find(@current_user.id).videos.order(:tutorial_id)
  end
end
