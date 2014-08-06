class RptobsController < ApplicationController
  before_action :set_rptob, only: [:show, :edit, :update, :destroy]

  # GET /rptobs
  # GET /rptobs.json
  def index
    @rptobs = Rptob.take(10)
  end

  # GET /rptobs/1
  # GET /rptobs/1.json
  def show
  end

  # GET /rptobs/new
  def new
    @rptob = Rptob.new
  end

  # GET /rptobs/1/edit
  def edit
  end

  # POST /rptobs
  # POST /rptobs.json
  def create
    @rptob = Rptob.new(rptob_params)

    respond_to do |format|
      if @rptob.save
        format.html { redirect_to @rptob, notice: 'Rptob was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rptob }
      else
        format.html { render action: 'new' }
        format.json { render json: @rptob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rptobs/1
  # PATCH/PUT /rptobs/1.json
  def update
    respond_to do |format|
      if @rptob.update(rptob_params)
        format.html { redirect_to @rptob, notice: 'Rptob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rptob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rptobs/1
  # DELETE /rptobs/1.json
  def destroy
    @rptob.destroy
    respond_to do |format|
      format.html { redirect_to rptobs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rptob
      @rptob = Rptob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rptob_params
      params.require(:rptob).permit(:pid, :hdid, :obsdate, :obsvalue, :change)
    end
end
