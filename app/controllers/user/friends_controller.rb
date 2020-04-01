class User::FriendsController < ApplicationController
	def create
		target = User.where(username: params[:username]).first
		source = User.find(params[:source])
		if !target || !source
			flash[:notice] = "Unable locate one or more users"
			redirect_back(fallback_loaction: '/')
		else
			create_friendship(source, target)
		end	
	end

	private
		
	def create_friendship(source, target) 
		previous_friendship = Friendship.where(friender_id: source.id, friendee_id: target.id)
		if previous_friendship.empty?
			Friendship.create(friender_id: source.id, friendee_id: target.id)
	 	  flash[:notice] = "Friendship Created"
			redirect_back(fallback_location: '/')
		else
			flash[:notice] = "Already a Friend"
			redirect_back(fallback_location: '/')
		end
	end
end
