class ClinicalRulesController < ApplicationController
  before_action :set_clinical_rule, only: [:show, :edit, :update, :destroy]

  # GET /clinical_rules
  # GET /clinical_rules.json

  #def populate
  #  Chrtrules.names_and_expanded_observations.each{|z| p z}
  #end

  def index
    @clinical_rules = ClinicalRule.all.sort{|a,b| a[1]<=>b[1]}
  end

  # GET /clinical_rules/1
  # GET /clinical_rules/1.json
  def show
  end

  # GET /clinical_rules/new
  def new
    @clinical_rule = ClinicalRule.new
  end

  # GET /clinical_rules/1/edit
  def edit
  end

  # POST /clinical_rules
  # POST /clinical_rules.json
  def create
    @clinical_rule = ClinicalRule.new(clinical_rule_params)

    respond_to do |format|
      if @clinical_rule.save
        format.html { redirect_to @clinical_rule, notice: 'Clinical rule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @clinical_rule }
      else
        format.html { render action: 'new' }
        format.json { render json: @clinical_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinical_rules/1
  # PATCH/PUT /clinical_rules/1.json
  def update
    respond_to do |format|
      if @clinical_rule.update(clinical_rule_params)
        format.html { redirect_to @clinical_rule, notice: 'Clinical rule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @clinical_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinical_rules/1
  # DELETE /clinical_rules/1.json
  def destroy
    @clinical_rule.destroy
    respond_to do |format|
      format.html { redirect_to clinical_rules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinical_rule
      @clinical_rule = ClinicalRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinical_rule_params
      params.require(:clinical_rule).permit(:name, :sex, :lowage, :highage, :problem, :medication, :allergy, :test, :comment)
    end
end
