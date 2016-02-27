class OnshoreYardsController < ApplicationController
  before_action :set_onshore_yard, only: [:show, :edit, :update, :destroy]
  layout "admin" , :except => :appindex
  before_action :authenticate_admin!, except: [:appindex]


  # GET /onshore_yards
  # GET /onshore_yards.json

  def appindex

  end

  def index
    @onshore_yards = OnshoreYard.all
  end

  # GET /onshore_yards/1
  # GET /onshore_yards/1.json
  def show
  end

  # GET /onshore_yards/new
  def new
    @onshore_yard = OnshoreYard.new
  end

  # GET /onshore_yards/1/edit
  def edit
  end

  # POST /onshore_yards
  # POST /onshore_yards.json
  def create
    @onshore_yard = OnshoreYard.new(onshore_yard_params)

    respond_to do |format|
      if @onshore_yard.save
        format.html { redirect_to @onshore_yard, notice: 'Onshore yard was successfully created.' }
        format.json { render :show, status: :created, location: @onshore_yard }
      else
        format.html { render :new }
        format.json { render json: @onshore_yard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onshore_yards/1
  # PATCH/PUT /onshore_yards/1.json
  def update
    respond_to do |format|
      if @onshore_yard.update(onshore_yard_params)
        format.html { redirect_to @onshore_yard, notice: 'Onshore yard was successfully updated.' }
        format.json { render :show, status: :ok, location: @onshore_yard }
      else
        format.html { render :edit }
        format.json { render json: @onshore_yard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onshore_yards/1
  # DELETE /onshore_yards/1.json
  def destroy
    @onshore_yard.destroy
    respond_to do |format|
      format.html { redirect_to onshore_yards_url, notice: 'Onshore yard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onshore_yard
      @onshore_yard = OnshoreYard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def onshore_yard_params
      params.require(:onshore_yard).permit(:description, :location, :area, :remark)
    end
end
