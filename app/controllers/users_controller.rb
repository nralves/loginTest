class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
		respond_to do |format|
			format.html {render :action => 'new'}
			format.json { head :ok }
		end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
  
  def index
	@users = User.all
	respond_to do |format|
        format.html {@users}
        format.json { render :json => @users }
	end
  end
end
