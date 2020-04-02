class Followee
  attr_reader :name, :url

  def initialize(data)
    @name = data[:login]
    @url = data[:html_url]
  end

	def link
    User.where(username: name).first
  end
end
