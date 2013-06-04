class FriendshipsController < ApplicationController
	  def create
	  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	  @reverse_friendship = @friendship.friend.friendships.build(:friend_id => current_user.id)
	  

	  @test_friendship = current_user.friendships.where("friend_id = \"#{params[:friend_id]}\"").first
	  
	if current_user.id != @friendship.friend.id	&& @test_friendship.nil?
		  if @friendship.save && @reverse_friendship.save
			flash[:notice] = "Added friend."
			redirect_to root_url
		  else
			flash[:error] = "Unable to add friend."
			redirect_to root_url
		  end
	else
		if !@test_friendship.nil?
			flash[:error] = "You cant befriend the same user twice"
			redirect_to root_url
		else
			flash[:error] = "you cant befriend yourself"
			redirect_to root_url
		end
	end	
end

	def destroy
	  @friendship = current_user.friendships.find(params[:id])
	  @reverse_friendship = @friendship.friend.friendships.where("friend_id = \"#{current_user.id}\"").first
	  
	  @reverse_friendship.destroy
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to current_user
	end
end
