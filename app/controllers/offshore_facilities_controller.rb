class OffshoreFacilitiesController < ApplicationController
  before_action :set_offshore_facility, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_admin!, except: [:appindex]

  layout "admin" , :except => :appindex

  def appindex

  end


  # GET /offshore_facilities
  # GET /offshore_facilities.json
  def index
    @offshore_facilities = OffshoreFacility.all
  end

  # GET /offshore_facilities/1
  # GET /offshore_facilities/1.json
  def show
  end

  # GET /offshore_facilities/new
  def new
    @offshore_facility = OffshoreFacility.new
  end

  # GET /offshore_facilities/1/edit
  def edit
  end

  # POST /offshore_facilities
  # POST /offshore_facilities.json
  def create
    @offshore_facility = OffshoreFacility.new(offshore_facility_params)

    respond_to do |format|
      if @offshore_facility.save
        format.html { redirect_to @offshore_facility, notice: 'Offshore facility was successfully created.' }
        format.json { render :show, status: :created, location: @offshore_facility }
      else
        format.html { render :new }
        format.json { render json: @offshore_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offshore_facilities/1
  # PATCH/PUT /offshore_facilities/1.json
  def update
    respond_to do |format|
      if @offshore_facility.update(offshore_facility_params)
        format.html { redirect_to @offshore_facility, notice: 'Offshore facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @offshore_facility }
      else
        format.html { render :edit }
        format.json { render json: @offshore_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offshore_facilities/1
  # DELETE /offshore_facilities/1.json
  def destroy
    @offshore_facility.destroy
    respond_to do |format|
      format.html { redirect_to offshore_facilities_url, notice: 'Offshore facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offshore_facility
      @offshore_facility = OffshoreFacility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offshore_facility_params
      params.require(:offshore_facility).permit(:equipment, :descripton)
    end
end
