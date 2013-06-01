class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
		respond_to do |format|
			format.html {redirect_to root_url, :notice => "Logged in successfully."}
			format.json { render :text => "{Logged in successfully.}", :status => 200 }
		end
    else
		respond_to do |format|
			format.html {render :action => 'new'}
			format.json { render :text => "{Wrong login.}", :status => 406 }
		end
    end
  end

  def destroy
    session[:user_id] = nil
	respond_to do |format|
			format.html {redirect_to root_url, :notice => "You have been logged out."}
			format.json { render :text => "{You have been logged out.}", :status => 200 }
		end
  end
end
