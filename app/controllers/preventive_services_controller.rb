class PreventiveServicesController < ApplicationController
  before_action :set_preventive_service, only: [:show, :edit, :update, :destroy]

  # GET /preventive_services
  # GET /preventive_services.json
  def index
    @preventive_services = PreventiveService.all
  end

  # GET /preventive_services/1
  # GET /preventive_services/1.json
  def show
  end

  # GET /preventive_services/new
  def new
    @preventive_service = PreventiveService.new
  end

  # GET /preventive_services/1/edit
  def edit
  end

  # POST /preventive_services
  # POST /preventive_services.json
  def create
    @preventive_service = PreventiveService.new(preventive_service_params)

    respond_to do |format|
      if @preventive_service.save
        format.html { redirect_to @preventive_service, notice: 'Preventive service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @preventive_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @preventive_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preventive_services/1
  # PATCH/PUT /preventive_services/1.json
  def update
    respond_to do |format|
      if @preventive_service.update(preventive_service_params)
        format.html { redirect_to @preventive_service, notice: 'Preventive service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @preventive_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preventive_services/1
  # DELETE /preventive_services/1.json
  def destroy
    @preventive_service.destroy
    respond_to do |format|
      format.html { redirect_to preventive_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preventive_service
      @preventive_service = PreventiveService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preventive_service_params
      params.require(:preventive_service).permit(:source, :name, :rule, :in_scope, :implemented)
    end
end
