# frozen_string_literal: true

class Follower # rubocop:todo Style/Documentation
  attr_reader :name, :url

  def initialize(data)
    @name = data[:login]
    @url = data[:html_url]
  end

  def link
    User.where(username: name).first
  end
end
