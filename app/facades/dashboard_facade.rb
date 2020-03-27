class DashboardFacade
  def initialize(current_user) 
   @current_user = current_user 
  end

  def generate_repo
    service = GithubService.new(@current_user)
    	service.repo_list.map do |repo|
      		Repo.new(repo)
	end
  end
  
end
