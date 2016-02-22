class ProjectsController < ApplicationController

  layout 'admin' ,  :except => [:appshow,:appindex]
  # layout 'application' , :only => [:appshow,:appindex]

  before_action :set_project, only: [:show, :edit, :update, :destroy,:appshow]
  before_action :authenticate_admin!, except: [:appindex,:appshow]


  #  app show

  def appshow

    render :layout => 'application'
  end
  # app index

  def appindex

    if params[:status].present? and params[:type].present?
      if params[:type] == "abroad"
        @projects = Project.all.where(:is_abroad => true).page(params[:page]).per(8)
      else
        @projects = Project.all.where(:status => params[:status], :project_type=>params[:type]).page(params[:page]).per(8)
      end
    elsif params[:status].present?
      @projects = Project.all.where(:status => params[:status]).page(params[:page]).per(8)
    else
      @projects = Project.all.page(params[:page]).per(8)
    end

  end


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.page(params[:page]).per(20)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.start_date = Timeliness.parse(params[:project][:start_date], :format => 'mm/dd/yyyy')
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        if params[:project][:start_date].present?
          @project.start_date = Timeliness.parse(params[:project][:start_date], :format => 'mm/dd/yyyy')
          @project.save
        end
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.friendly.find(params[:id])
    @title = @project.title
    @content = @project.title + ' started at ' + @project.start_date.to_s + ' for ' + @project.client_name.to_s +
        ' with ' + @project.contract_type + ' contract type ' + 'and lasted '+ @project.duration.to_s + ' month, located at '  + @project.location + ', ' + @project.design_capacity + ' design capacity and ' + @project.construction_man_hour.to_s + ' construction man hour.'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :client_name, :start_date, :contract_type, :location, :duration, :design_capacity, :status , :project_type , :construction_man_hour, :is_abroad , {avatars: []})
  end
end
