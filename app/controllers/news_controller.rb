class NewsController < ApplicationController

  layout 'admin' , :except => [:appshow,:appindex]
  # layout 'application' , :only => [:appshow,:appindex]

  before_action :set_news, only: [:show, :edit, :update, :destroy,:appshow]
  before_action :authenticate_admin!, except: [:appindex,:appshow]
  before_action :check_date, only: [:appindex]


  #  app show

  def appshow
    if @news.published == false
      redirect_to :back , alert: "There is no access to this page."
    end
  end
  # app index

  def appindex
    @news = News.all.where(:published => true).page(params[:page]).per(8)
  end

  # GET /news
  # GET /news.json
  def index
    @news = News.all.page(params[:page]).per(20)
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)
    @news.publish_date = Timeliness.parse(params[:news][:publish_date], :format => 'mm/dd/yyyy')
    respond_to do |format|
      # if not @news.published
      #   if not @news.publish_date.present?
      #     redirect_to :back , alert: "You should set a date, please try again."
      #   end
      # end
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
  def update

    respond_to do |format|
      if @news.update(news_params)
        if params[:news][:publish_date].present?
          @news.publish_date = Timeliness.parse(params[:news][:publish_date], :format => 'mm/dd/yyyy')
          @news.save
        end
        format.html { redirect_to @news , notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_news
    @news = News.friendly.find(params[:id])
    @title = @news.title
    @content = @news.caption
  end

  def check_date
    # if @news.published == false
    #   byebug
    #   if Timeliness.parse(@news.publish_date , :format => 'mm/dd/yyyy') >= Time.now
    #     @news.published = true
    #     @news.save
    #   end
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def news_params
    params.require(:news).permit(:project_id, :title,:caption, :published,  {avatars: []})
  end
end
