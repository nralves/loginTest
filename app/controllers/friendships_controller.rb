class FriendshipsController < ApplicationController
	  def create
	  
	  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	  @reverse_friendship = @friendship.friend.friendships.build(:friend_id => current_user.id)
	  @test_friendship = current_user.friendships.where("friend_id = \"#{params[:friend_id]}\"").first
	  
	if current_user.id != @friendship.friend.id	&& @test_friendship.nil?
		  if @friendship.save && @reverse_friendship.save
			flash[:notice] = "Added friend."
			request = current_user.requests.where("requester_id = \"#{params[:friend_id]}\"").first
			request.destroy
			
			respond_to do |format|
				format.html { redirect_to root_url }
				format.json { head :ok }
			end
		  else
			flash[:error] = "Unable to add friend."
			respond_to do |format|
				format.html { redirect_to root_url }
				format.json { head :unprocessable_entity }
			end
		  end
	else
		if !@test_friendship.nil?
			flash[:error] = "You cant befriend the same user twice"
			respond_to do |format|
				format.html { redirect_to root_url }
				format.json { head :not_acceptable }
			end
		else
			flash[:error] = "you cant befriend yourself"
			respond_to do |format|
				format.html { redirect_to root_url }
				format.json { head :not_acceptable }
			end
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
