class PrblooksController < ApplicationController
  before_action :set_prblook, only: [:show, :edit, :update, :destroy]

  # GET /prblooks
  # GET /prblooks.json
  def index
    @prblooks = Prblook.all
  end

  # GET /prblooks/1
  # GET /prblooks/1.json
  def show
  end

  # GET /prblooks/new
  def new
    @prblook = Prblook.new
  end

  # GET /prblooks/1/edit
  def edit
  end

  # POST /prblooks
  # POST /prblooks.json
  def create
    @prblook = Prblook.new(prblook_params)

    respond_to do |format|
      if @prblook.save
        format.html { redirect_to @prblook, notice: 'Prblook was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prblook }
      else
        format.html { render action: 'new' }
        format.json { render json: @prblook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prblooks/1
  # PATCH/PUT /prblooks/1.json
  def update
    respond_to do |format|
      if @prblook.update(prblook_params)
        format.html { redirect_to @prblook, notice: 'Prblook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prblook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prblooks/1
  # DELETE /prblooks/1.json
  def destroy
    @prblook.destroy
    respond_to do |format|
      format.html { redirect_to prblooks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prblook
      @prblook = Prblook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prblook_params
      params.require(:prblook).permit(:description, :longdescr, :mlcode, :keyword, :codetype, :standard)
    end
end
