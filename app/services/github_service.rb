class GithubService
  def initialize

  end

  def repo_list
    get_json("/users/itemniner/repos")
  end
  
  private
  
  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.github.com") do |f|
      f.adapter  Faraday.default_adapter
      f.headers[:Authorization] = "token #{ENV['GITHUB_API_KEY']}"
    end
  end
end
