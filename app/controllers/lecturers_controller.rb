class LecturersController < ApplicationController
  # GET /lecturers
  # GET /lecturers.json
  def index
    @lecturers = Lecturer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  # GET /lecturers/1
  # GET /lecturers/1.json
  def show
    @lecturer = Lecturer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lecturer }
    end
  end

  # GET /lecturers/new
  # GET /lecturers/new.json
  def new
    @lecturer = Lecturer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lecturer }
    end
  end

  # GET /lecturers/1/edit
  def edit
    @lecturer = Lecturer.find(params[:id])
  end

  # POST /lecturers
  # POST /lecturers.json
  def create
    @lecturer = Lecturer.new(params[:lecturer])
	
	users = User.all
	
	users.each do |user|
		if user.emails.find_by_email(user.email).confirmed && user.email == @lecturer.email
			@lecturer.user_id = user.id
		end
	end

    respond_to do |format|
      if @lecturer.save
	  
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully created.' }
        format.json { render json: @lecturer, status: :created, location: @lecturer }
      else
        format.html { render action: "new" }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lecturers/1
  # PUT /lecturers/1.json
  def update
    @lecturer = Lecturer.find(params[:id])

    respond_to do |format|
      if @lecturer.update_attributes(params[:lecturer])
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturers/1
  # DELETE /lecturers/1.json
  def destroy
    @lecturer = Lecturer.find(params[:id])
    @lecturer.destroy

    respond_to do |format|
      format.html { redirect_to lecturers_url }
      format.json { head :no_content }
    end
  end
  
  def getlecturers
	if request.post?
		date = params[:date]
		id = params[:id]
		#@lecturers = Lecturer.where("updated_at >= \"#{date}\" and conference_id = \"#{id}\"")
		@lecturers = Lecturer.where("lecturers.updated_at >= \"#{date}\"").joins("INNER JOIN posters").joins("INNER JOIN events").joins("INNER JOIN blocks ON blocks.conference_id= \"#{id}\"").group("lecturers.id")

		respond_to do |format|
		  format.html {redirect_to lecturers_url}
		  format.json #{ render json:  @news.to_json(:only => ["title","body","updated_at", "conference_id"])}
		end
	else
		respond_to do |format|
		  format.html {redirect_to root_url}
		  format.json { render json: "Bad Request", status: :bad_request }
		end
	end
  
  end
  
end
