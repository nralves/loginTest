class NewsController < ApplicationController
  # GET /news
  # GET /news.json
  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/new
  # GET /news/new.json
  def new
    @news = News.new
	@conferences = Conference.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(params[:news])
	@conferences = Conference.all

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end
  
  #Nao esta a ser utilizado, pois ja nao e necessario
  def checkDate
	@news = News.find(:all, :order => 'updated_at DESC', :limit => 1)
	
	respond_to do |format|
      format.html { render action: "date", notice: 'Date'}
      format.json { render json: @news.to_json(:only => ["updated_at"]), status: :ok }
    end
  end
  
  def getnews
	if request.post?
		date = params[:date]
		id = params[:id]
		@news = News.where("updated_at >= \"#{date}\" and conference_id = \"#{id}\"")

		respond_to do |format|
		  format.html {redirect_to news_index_url}
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
