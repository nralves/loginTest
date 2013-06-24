class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :test]

  def test
	if logged_in?
		respond_to do |format|
			format.html {render :action => 'test' }
			format.json { render :text => "{Accepted}", :status => 200 }
		end
	else
		respond_to do |format|
			format.html {render :action => 'test' }
			format.json { render :text => "{Please login}", :status => 200 }
		end
	end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
	  respond_to do |format|
			format.html {redirect_to users_url, :notice => "Thank you for signing up! You are now logged in."}
			format.json { head :ok }
		end
    else
		respond_to do |format|
			format.html {render :action => 'new'}
			format.json { render :text => "{Rejected}", :status => 406 }
		end
    end
  end

  def edit
    @user = current_user
  end

  def update
	params[:user][:conferences_ids] ||= []  
    @user = current_user
    if @user.update_attributes(params[:user])
	  respond_to do |format|
        format.html { redirect_to root_url, :notice => "Your profile has been updated."}
        format.json {render :text => "{Updated}", :status => 200 }
	  end
    else
      
	  respond_to do |format|
        format.html {render :action => 'edit'}
        format.json {render :text => "{Not updated}", :status => 406 }
	  end
    end
  end
  
  def index
	@users = User.all
	respond_to do |format|
        format.html {@users}
        format.json
	end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end
  
  def getprofile
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end
  
  def getrequests
	user = current_user
	
	if !user.nil?
	@requests = user.requests
		respond_to do |format|
			format.html { @requests }
			format.json
		end
	else
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
	
	end
  end
  
  def rejectrequest
	
		if !current_user.nil?
			request = current_user.requests.find(params[:id])
			if !request.nil?
				request.destroy
				respond_to do |format|
					format.html { redirect_to users_url, :notice => "OK" }
					format.json { head :ok}
				end
			else
			respond_to do |format|
					format.html { redirect_to users_url, :notice => "Request no found" }
					format.json { head :bad_request }
				end
			end
		else
			respond_to do |format|
				format.html { redirect_to users_url, :notice => "Not loged in" }
				format.json { head :unauthorized }
			end
		
		end
  end
  
   def removefriend
	
		if !current_user.nil?
			friendship = current_user.friendships.where("friend_id = \"#{:friend_id}\"").first
			
			if !friendship.nil?
				reverse_friendship = friendship.friend.friendships.where("friend_id = \"#{current_user.id}\"").first
			end
			
			if !friendship.nil?
				friendship.destroy
				reverse_friendship.destroy
				respond_to do |format|
					format.html { redirect_to users_url, :notice => "OK" }
					format.json { head :ok}
				end
			else
			respond_to do |format|
					format.html { redirect_to users_url, :notice => "Friendship not found" }
					format.json { head :bad_request }
				end
			end
		else
			respond_to do |format|
				format.html { redirect_to users_url, :notice => "Not loged in" }
				format.json { head :unauthorized }
			end
		
		end
  end
end
