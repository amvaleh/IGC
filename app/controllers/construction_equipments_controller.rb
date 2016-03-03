class ConstructionEquipmentsController < ApplicationController
  before_action :set_construction_equipment, only: [:show, :edit, :update, :destroy]

  layout "admin" , :except => :appindex
  before_action :authenticate_admin!, except: [:appindex]

  def appindex
    @construction_equipments = ConstructionEquipment.all
  end


  # GET /construction_equipments
  # GET /construction_equipments.json
  def index
    @construction_equipments = ConstructionEquipment.all
  end

  # GET /construction_equipments/1
  # GET /construction_equipments/1.json
  def show
  end

  # GET /construction_equipments/new
  def new
    @construction_equipment = ConstructionEquipment.new
  end

  # GET /construction_equipments/1/edit
  def edit
  end

  # POST /construction_equipments
  # POST /construction_equipments.json
  def create
    @construction_equipment = ConstructionEquipment.new(construction_equipment_params)
    respond_to do |format|
      if @construction_equipment.save
        format.html { redirect_to @construction_equipment, notice: 'Construction equipment was successfully created.' }
        format.json { render :show, status: :created, location: @construction_equipment }
      else
        format.html { render :new }
        format.json { render json: @construction_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_equipments/1
  # PATCH/PUT /construction_equipments/1.json
  def update
    respond_to do |format|
      if @construction_equipment.update(construction_equipment_params)
        format.html { redirect_to @construction_equipment, notice: 'Construction equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction_equipment }
      else
        format.html { render :edit }
        format.json { render json: @construction_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_equipments/1
  # DELETE /construction_equipments/1.json
  def destroy
    @construction_equipment.destroy
    respond_to do |format|
      format.html { redirect_to construction_equipments_url, notice: 'Construction equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_equipment
      @construction_equipment = ConstructionEquipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def construction_equipment_params
      params.require(:construction_equipment).permit(:construction_equipment_category_id , :production_date, :quantity, :Description)
    end
end
