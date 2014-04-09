class UspstfRecsController < ApplicationController
  before_action :set_uspstf_rec, only: [:show, :edit, :update, :destroy]

  # GET /uspstf_recs
  # GET /uspstf_recs.json
  def index
    @uspstf_recs = UspstfRec.all
  end

  # GET /uspstf_recs/1
  # GET /uspstf_recs/1.json
  def show
  end

  # GET /uspstf_recs/new
  def new
    @uspstf_rec = UspstfRec.new
  end

  # GET /uspstf_recs/1/edit
  def edit
  end

  # POST /uspstf_recs
  # POST /uspstf_recs.json
  def create
    @uspstf_rec = UspstfRec.new(uspstf_rec_params)

    respond_to do |format|
      if @uspstf_rec.save
        format.html { redirect_to @uspstf_rec, notice: 'Uspstf rec was successfully created.' }
        format.json { render action: 'show', status: :created, location: @uspstf_rec }
      else
        format.html { render action: 'new' }
        format.json { render json: @uspstf_rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uspstf_recs/1
  # PATCH/PUT /uspstf_recs/1.json
  def update
    respond_to do |format|
      if @uspstf_rec.update(uspstf_rec_params)
        format.html { redirect_to @uspstf_rec, notice: 'Uspstf rec was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uspstf_rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uspstf_recs/1
  # DELETE /uspstf_recs/1.json
  def destroy
    @uspstf_rec.destroy
    respond_to do |format|
      format.html { redirect_to uspstf_recs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uspstf_rec
      @uspstf_rec = UspstfRec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uspstf_rec_params
      params.require(:uspstf_rec).permit(:topic, :description, :grade, :release_date, :in_scope, :reminder_implemented, :score_implemented)
    end
end
