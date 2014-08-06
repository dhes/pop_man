class MostRecentObservationsController < ApplicationController
  before_action :set_most_recent_observation, only: [:show, :edit, :update, :destroy]

  # GET /most_recent_observations
  # GET /most_recent_observations.json
  def index
    @most_recent_observations = MostRecentObservation.observations_of_interest
  end

  # GET /most_recent_observations/1
  # GET /most_recent_observations/1.json
  def show
  end

  # GET /most_recent_observations/new
  def new
    @most_recent_observation = MostRecentObservation.new
  end

  # GET /most_recent_observations/1/edit
  def edit
  end

  # POST /most_recent_observations
  # POST /most_recent_observations.json
  def create
    @most_recent_observation = MostRecentObservation.new(most_recent_observation_params)

    respond_to do |format|
      if @most_recent_observation.save
        format.html { redirect_to @most_recent_observation, notice: 'Most recent observation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @most_recent_observation }
      else
        format.html { render action: 'new' }
        format.json { render json: @most_recent_observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /most_recent_observations/1
  # PATCH/PUT /most_recent_observations/1.json
  def update
    respond_to do |format|
      if @most_recent_observation.update(most_recent_observation_params)
        format.html { redirect_to @most_recent_observation, notice: 'Most recent observation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @most_recent_observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /most_recent_observations/1
  # DELETE /most_recent_observations/1.json
  def destroy
    @most_recent_observation.destroy
    respond_to do |format|
      format.html { redirect_to most_recent_observations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_most_recent_observation
      @most_recent_observation = MostRecentObservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def most_recent_observation_params
      params.require(:most_recent_observation).permit(:pid, :hdid, :obsdate, :obsvalue)
    end
end
