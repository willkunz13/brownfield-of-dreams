# frozen_string_literal: true

class Repo # rubocop:todo Style/Documentation
  attr_reader :name, :url

  def initialize(data)
    @name = data[:name]
    @url = data[:html_url]
  end
end
