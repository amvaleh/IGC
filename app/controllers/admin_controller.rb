class AdminController < ApplicationController

  before_action :authenticate_admin!

  def dashboard

  end

# NEWS section

  before_action :set_news, only: [:show, :edit, :update, :destroy]


  def news_index
    @news = News.all
  end
  
 # GET /news/1
  # GET /news/1.json
  def news_show
  end

  # GET /news/new
  def news_new
    @news = News.new
  end

  # GET /news/1/edit
  def news_edit
  end

  # POST /news
  # POST /news.json
  def news_create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def news_update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def news_destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def news_set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:project_id, :title,:caption , {avatars: []})
    end


# Projects section 


end
