class ConferencesController < ApplicationController
  # GET /conferences
  # GET /conferences.json
  def index
    @conferences = Conference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conferences }
    end
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
    @conference = Conference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conference }
    end
  end

  # GET /conferences/new
  # GET /conferences/new.json
  def new
    @conference = Conference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conference }
    end
  end

  # GET /conferences/1/edit
  def edit
    @conference = Conference.find(params[:id])
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(params[:conference])

    respond_to do |format|
      if @conference.save
        format.html { redirect_to @conference, notice: 'Conference was successfully created.' }
        format.json { render json: @conference, status: :created, location: @conference }
      else
        format.html { render action: "new" }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conferences/1
  # PUT /conferences/1.json
  def update
	params[:conference][:users_ids] ||= []  
    @conference = Conference.find(params[:id])

    respond_to do |format|
      if @conference.update_attributes(params[:conference])
        format.html { redirect_to @conference, notice: 'Conference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference = Conference.find(params[:id])
    @conference.destroy

    respond_to do |format|
      format.html { redirect_to conferences_url }
      format.json { head :no_content }
    end
  end
  
  def conferencedownload
  @conference = Conference.find(params[:id])
  
  participants = @conference.participants
  
  if !participants.nil? && !current_user.nil?
	participants.each do |participant|
		if participant.email == current_user.email && current_user.emails.find_by_email(current_user.email).confirmed
			userTest = @conference.users.find_by_email(params[current_user.email])
			if userTest.nil?
				@conference.users << current_user
			end
		end
	end
	end
  
  @lecturersArray = Array.new
		 respond_to do |format|
		  format.html { redirect_to conferences_url }
		  format.json 
					  
		 end
  end
  
  
  def getallconferences
	@conferences = Conference.all
	
	
		
		respond_to do |format|
		  format.html { redirect_to conferences_url }
		  format.json
		  
		  #{ render :json => @conferences.to_json(:only => [:name, :location, :begin, :end]) }
		 end
  
  end
  
  def import
	Conference.import(params[:file])
	redirect_to root_url, notice: "Conferences imported."
  end

  #Pre condicao: User registado na app
  def addUser
	conference = Conference.find(params[:id])
	userTest = conference.users.find_by_email(params[:email])
	if userTest.nil?
		conference.users << User.find_by_email(params[:email])
		redirect_to conferences_url, notice: 'User Added'
	else
		redirect_to conferences_url, notice: 'Cant add the same User twice'
	end
  end
  
  def removeUser
	conference = Conference.find(params[:id])
	user = conference.users.find_by_email(params[:email])
	if !user.nil?
	conference.users.delete(user)
	redirect_to conferences_url, notice: 'User removed'
	else
		redirect_to conferences_url, notice: 'Cant remove a non-added user'
	end
  end
  
  
    
  def addParticipant
	conference = Conference.find(params[:id])
	participantTest = conference.participants.find_by_email(params[:email])
	if participantTest.nil?
		participant= Participant.new(:email => params[:email])
		conference.participants << participant
		redirect_to conferences_url, notice: 'Participant Added'
	else
		redirect_to conferences_url, notice: 'Cant add the same Participant twice'
	end
  end
  
  def removeParticipant
	conference = Conference.find(params[:id])
	participant = conference.participants.find_by_email(params[:email])
	if !participant.nil?
	conference.participants.delete(participant)
	redirect_to conferences_url, notice: 'Participant removed'
	else
		redirect_to conferences_url, notice: 'Cant remove a non-added participant'
	end
  end
  
  
end
