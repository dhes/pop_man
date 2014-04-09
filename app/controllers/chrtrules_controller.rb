class ChrtrulesController < ApplicationController
  before_action :set_chrtrule, only: [:show, :edit, :update, :destroy]

  # GET /chrtrules
  # GET /chrtrules.json

  def index
    #expanded_observations_as_description = expanded_observations_as_hdid.map{|w| [w[0], Obshead.find(w[1]).description]}.sort
    @chrtrules = Chrtrule.names_and_expanded_observations
  end

  # GET /chrtrules/1
  # GET /chrtrules/1.json
  def show
  end

  # GET /chrtrules/new
  def new
    @chrtrule = Chrtrule.new
  end

  # GET /chrtrules/1/edit
  def edit
  end

  # POST /chrtrules
  # POST /chrtrules.json
  def create
    @chrtrule = Chrtrule.new(chrtrule_params)

    respond_to do |format|
      if @chrtrule.save
        format.html { redirect_to @chrtrule, notice: 'Chrtrule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chrtrule }
      else
        format.html { render action: 'new' }
        format.json { render json: @chrtrule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chrtrules/1
  # PATCH/PUT /chrtrules/1.json
  def update
    respond_to do |format|
      if @chrtrule.update(chrtrule_params)
        format.html { redirect_to @chrtrule, notice: 'Chrtrule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chrtrule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chrtrules/1
  # DELETE /chrtrules/1.json
  def destroy
    @chrtrule.destroy
    respond_to do |format|
      format.html { redirect_to chrtrules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chrtrule
      @chrtrule = Chrtrule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chrtrule_params
      params.require(:chrtrule).permit(:name, :rulecomment)
    end
end
