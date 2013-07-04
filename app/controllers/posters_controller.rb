class PostersController < ApplicationController
  # GET /posters
  # GET /posters.json
  def index
    @posters = Poster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posters }
    end
  end

  # GET /posters/1
  # GET /posters/1.json
  def show
    @poster = Poster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poster }
    end
  end
  
  def theposter
    @poster = Poster.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @poster }
    end
  end
  
  def edittheposter
    @poster = Poster.find(params[:id])
	@blocks = Block.all
	@lecturers = Lecturer.all
  end
  
  def updatetheposter
    @poster = Poster.find(params[:id])
	@blocks = Block.all
	@lecturers = Lecturer.all

    respond_to do |format|
      if @poster.update_attributes(params[:poster])
        format.html { render action: "theposter", :id=> @poster.id, notice: 'Poster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { head :bad_request }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # GET /posters/new
  # GET /posters/new.json
  def new
    @poster = Poster.new
	@blocks = Block.all
	@lecturers = Lecturer.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poster }
    end
  end

  # GET /posters/1/edit
  def edit
    @poster = Poster.find(params[:id])
	@blocks = Block.all
	@lecturers = Lecturer.all
  end

  # POST /posters
  # POST /posters.json
  def create
    @poster = Poster.new(params[:poster])
	@blocks = Block.all
	@lecturers = Lecturer.all

    respond_to do |format|
      if @poster.save
        format.html { redirect_to @poster, notice: 'Poster was successfully created.' }
        format.json { render json: @poster, status: :created, location: @poster }
      else
        format.html { render action: "new" }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posters/1
  # PUT /posters/1.json
  def update
    @poster = Poster.find(params[:id])
	@blocks = Block.all
	@lecturers = Lecturer.all

    respond_to do |format|
      if @poster.update_attributes(params[:poster])
        format.html { redirect_to @poster, notice: 'Poster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posters/1
  # DELETE /posters/1.json
  def destroy
    @poster = Poster.find(params[:id])
    @poster.destroy

    respond_to do |format|
      format.html { redirect_to posters_url }
      format.json { head :no_content }
    end
  end
  
  def download_poster_info
    @poster = Poster.find(params[:id])
    send_file(@poster.file.path,
          :filename => @poster.file.filename,
          :type => @poster.file.file.extension.downcase,
          :disposition => 'attachment',
          :url_based_filename => false)
  end
  
  def download_poster
    @poster = Poster.find(params[:id])
    send_file(@poster.poster.path,
          :filename => @poster.poster.filename,
          :type => @poster.poster.file.extension.downcase,
          :disposition => 'attachment',
          :url_based_filename => false)
  end
  
  def vote
	poster = Poster.find(params[:id])
	
	if !poster.nil?
		nvotes = poster.votes+1
		poster.update_attributes(:votes=>nvotes)
	end
	
	
	respond_to do |format|
      if !poster.nil?
        format.html { head :ok }
        format.json { render json: poster.votes }
      else
        format.html { render action: "edit" }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
	
  end
  
  
  
  def getposters
	if request.post?
		date = params[:date]
		id = params[:id]
		#@posters = Poster.where("updated_at >= \"#{date}\" and conference_id = \"#{}\"")
		@posters = Poster.where("posters.updated_at >= \"#{date}\"").joins("INNER JOIN blocks ON blocks.conference_id= \"#{id}\"").group("posters.id")

		respond_to do |format|
		  format.html {redirect_to posters_url}
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
