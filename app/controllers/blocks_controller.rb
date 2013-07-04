class BlocksController < ApplicationController
  # GET /blocks
  # GET /blocks.json
  def index
    @blocks = Block.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blocks }
    end
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
    @block = Block.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @block }
    end
  end

  # GET /blocks/new
  # GET /blocks/new.json
  def new
    @block = Block.new
	@conferences = Conference.all
	@tracks = Track.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @block }
    end
  end

  # GET /blocks/1/edit
  def edit
    @block = Block.find(params[:id])
	@conferences = Conference.all
	@tracks = Track.all
  end

  # POST /blocks
  # POST /blocks.json
  def create
    @block = Block.new(params[:block])
	@conferences = Conference.all
	@tracks = Track.all

    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.json { render json: @block, status: :created, location: @block }
      else
        format.html { render action: "new" }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blocks/1
  # PUT /blocks/1.json
  def update
    @block = Block.find(params[:id])
	@conferences = Conference.all
	@tracks = Track.all

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    @block = Block.find(params[:id])
    @block.destroy

    respond_to do |format|
      format.html { redirect_to blocks_url }
      format.json { head :no_content }
    end
  end
  
  def getblocks
	if request.post?
		date = params[:date]
		id = params[:id]
		@blocks = Block.where("updated_at >= \"#{date}\" and conference_id = \"#{id}\"").group("blocks.id")

		respond_to do |format|
		  format.html {redirect_to blocks_url}
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
