class HomeGalleriesController < ApplicationController
  before_action :set_home_gallery, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  before_action :authenticate_admin!

  # GET /home_galleries
  # GET /home_galleries.json
  def index
    @home_galleries = HomeGallery.all.page(params[:page]).per(20)
  end

  # GET /home_galleries/1
  # GET /home_galleries/1.json
  def show
  end

  # GET /home_galleries/new
  def new
    @home_gallery = HomeGallery.new
  end

  # GET /home_galleries/1/edit
  def edit
  end

  # POST /home_galleries
  # POST /home_galleries.json
  def create
    @home_gallery = HomeGallery.new(home_gallery_params)

    respond_to do |format|
      if @home_gallery.save
        format.html { redirect_to @home_gallery, notice: 'Home gallery was successfully created.' }
        format.json { render :show, status: :created, location: @home_gallery }
      else
        format.html { render :new }
        format.json { render json: @home_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_galleries/1
  # PATCH/PUT /home_galleries/1.json
  def update
    respond_to do |format|
      if @home_gallery.update(home_gallery_params)
        format.html { redirect_to @home_gallery, notice: 'Home gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_gallery }
      else
        format.html { render :edit }
        format.json { render json: @home_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_galleries/1
  # DELETE /home_galleries/1.json
  def destroy
    @home_gallery.destroy
    respond_to do |format|
      format.html { redirect_to home_galleries_url, notice: 'Home gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_gallery
      @home_gallery = HomeGallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_gallery_params
      params.require(:home_gallery).permit({avatars: []})
    end
end
