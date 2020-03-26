class DashboardFacade
  def initialize 
    
  end

  def generate_repo
    service = GithubService.new

    service.repo_list.map do |repo|
      Repo.new(repo)
    end
  end
  
end