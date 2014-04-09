class ObsheadsController < ApplicationController
  before_action :set_obshead, only: [:show, :edit, :update, :destroy]

  # GET /obsheads
  # GET /obsheads.json

  def interesting_hdids
    a = Chrtrule.all
    a.map{|z| z.tests.split('^ ')}.flatten.map{|w| w.split('~')}.flatten.map{|x| x.split('|')[0].to_i}.uniq
  end

  def index
    @obsheads = Obshead.find(interesting_hdids)
  end

  # GET /obsheads/1
  # GET /obsheads/1.json
  def show
  end

  # GET /obsheads/new
  def new
    @obshead = Obshead.new
  end

  # GET /obsheads/1/edit
  def edit
  end

  # POST /obsheads
  # POST /obsheads.json
  def create
    @obshead = Obshead.new(obshead_params)

    respond_to do |format|
      if @obshead.save
        format.html { redirect_to @obshead, notice: 'Obshead was successfully created.' }
        format.json { render action: 'show', status: :created, location: @obshead }
      else
        format.html { render action: 'new' }
        format.json { render json: @obshead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /obsheads/1
  # PATCH/PUT /obsheads/1.json
  def update
    respond_to do |format|
      if @obshead.update(obshead_params)
        format.html { redirect_to @obshead, notice: 'Obshead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @obshead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obsheads/1
  # DELETE /obsheads/1.json
  def destroy
    @obshead.destroy
    respond_to do |format|
      format.html { redirect_to obsheads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obshead
      @obshead = Obshead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obshead_params
      params.require(:obshead).permit(:hdid, :name, :description, :mlcode, :cptcode, :icdcode, :loinccode, :snomedcode)
    end
end
