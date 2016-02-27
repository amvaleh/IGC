class ConstructionEquipmentCategoriesController < ApplicationController
  before_action :set_construction_equipment_category, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_admin!
  layout "admin"


  # GET /construction_equipment_categories
  # GET /construction_equipment_categories.json
  def index
    @construction_equipment_categories = ConstructionEquipmentCategory.all
  end

  # GET /construction_equipment_categories/1
  # GET /construction_equipment_categories/1.json
  def show
  end

  # GET /construction_equipment_categories/new
  def new
    @construction_equipment_category = ConstructionEquipmentCategory.new
  end

  # GET /construction_equipment_categories/1/edit
  def edit
  end

  # POST /construction_equipment_categories
  # POST /construction_equipment_categories.json
  def create
    @construction_equipment_category = ConstructionEquipmentCategory.new(construction_equipment_category_params)

    respond_to do |format|
      if @construction_equipment_category.save
        format.html { redirect_to @construction_equipment_category, notice: 'Construction equipment category was successfully created.' }
        format.json { render :show, status: :created, location: @construction_equipment_category }
      else
        format.html { render :new }
        format.json { render json: @construction_equipment_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_equipment_categories/1
  # PATCH/PUT /construction_equipment_categories/1.json
  def update
    respond_to do |format|
      if @construction_equipment_category.update(construction_equipment_category_params)
        format.html { redirect_to @construction_equipment_category, notice: 'Construction equipment category was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction_equipment_category }
      else
        format.html { render :edit }
        format.json { render json: @construction_equipment_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_equipment_categories/1
  # DELETE /construction_equipment_categories/1.json
  def destroy
    @construction_equipment_category.destroy
    respond_to do |format|
      format.html { redirect_to construction_equipment_categories_url, notice: 'Construction equipment category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_equipment_category
      @construction_equipment_category = ConstructionEquipmentCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def construction_equipment_category_params
      params.require(:construction_equipment_category).permit(:name)
    end
end
