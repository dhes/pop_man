class PmScoresController < ApplicationController
  before_action :set_pm_score, only: [:show, :edit, :update, :destroy]

  # GET /pm_scores
  # GET /pm_scores.json
  def index
    sorted = PmScore.all.order('measure', 'score_date')
    #unsorted.sort_by!{|x| x[0]}#.map{|a,b| a[2] <=> b[2]}
    @pm_scores = sorted
  end
  # GET /pm_scores/1
  # GET /pm_scores/1.json
  def show
  end

  # GET /pm_scores/new
  def new
    @pm_score = PmScore.new
  end

  # GET /pm_scores/1/edit
  def edit
  end

  # POST /pm_scores
  # POST /pm_scores.json
  def create
    @pm_score = PmScore.new(pm_score_params)

    respond_to do |format|
      if @pm_score.save
        format.html { redirect_to @pm_score, notice: 'Pm score was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pm_score }
      else
        format.html { render action: 'new' }
        format.json { render json: @pm_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pm_scores/1
  # PATCH/PUT /pm_scores/1.json
  def update
    respond_to do |format|
      if @pm_score.update(pm_score_params)
        format.html { redirect_to @pm_score, notice: 'Pm score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pm_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pm_scores/1
  # DELETE /pm_scores/1.json
  def destroy
    @pm_score.destroy
    respond_to do |format|
      format.html { redirect_to pm_scores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pm_score
      @pm_score = PmScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pm_score_params
      params.require(:pm_score).permit(:measure, :score, :score_date, :numer, :denom)
    end
end
