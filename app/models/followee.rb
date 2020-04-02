# frozen_string_literal: true

class Followee # rubocop:todo Style/Documentation
  attr_reader :name, :url

  def initialize(data)
    @name = data[:login]
    @url = data[:html_url]
  end

  def link
    User.where(username: name).first
  end
end
