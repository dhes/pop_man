class PreventiveServiceRecommendationsController < ApplicationController
  before_action :set_preventive_service_recommendation, only: [:show, :edit, :update, :destroy]

  # GET /preventive_service_recommendations
  # GET /preventive_service_recommendations.json
  def index
    @preventive_service_recommendations = PreventiveServiceRecommendation.all
  end

  # GET /preventive_service_recommendations/1
  # GET /preventive_service_recommendations/1.json
  def show
  end

  # GET /preventive_service_recommendations/new
  def new
    @preventive_service_recommendation = PreventiveServiceRecommendation.new
  end

  # GET /preventive_service_recommendations/1/edit
  def edit
  end

  # POST /preventive_service_recommendations
  # POST /preventive_service_recommendations.json
  def create
    @preventive_service_recommendation = PreventiveServiceRecommendation.new(preventive_service_recommendation_params)

    respond_to do |format|
      if @preventive_service_recommendation.save
        format.html { redirect_to @preventive_service_recommendation, notice: 'Preventive service recommendation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @preventive_service_recommendation }
      else
        format.html { render action: 'new' }
        format.json { render json: @preventive_service_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preventive_service_recommendations/1
  # PATCH/PUT /preventive_service_recommendations/1.json
  def update
    respond_to do |format|
      if @preventive_service_recommendation.update(preventive_service_recommendation_params)
        format.html { redirect_to @preventive_service_recommendation, notice: 'Preventive service recommendation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @preventive_service_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preventive_service_recommendations/1
  # DELETE /preventive_service_recommendations/1.json
  def destroy
    @preventive_service_recommendation.destroy
    respond_to do |format|
      format.html { redirect_to preventive_service_recommendations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preventive_service_recommendation
      @preventive_service_recommendation = PreventiveServiceRecommendation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preventive_service_recommendation_params
      params.require(:preventive_service_recommendation).permit(:title, :description, :source, :in_scope?, :implemented?)
    end
end
