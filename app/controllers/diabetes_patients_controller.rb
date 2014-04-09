class DiabetesPatientsController < ApplicationController
  before_action :set_diabetes_patient, only: [:show, :edit, :update, :destroy]

  # GET /diabetes_patients
  # GET /diabetes_patients.json
  def index
    @diabetes_patients = DiabetesPatient.all
  end

  # GET /diabetes_patients/1
  # GET /diabetes_patients/1.json
  def show
  end

  # GET /diabetes_patients/new
  def new
    @diabetes_patient = DiabetesPatient.new
  end

  # GET /diabetes_patients/1/edit
  def edit
  end

  # POST /diabetes_patients
  # POST /diabetes_patients.json
  def create
    @diabetes_patient = DiabetesPatient.new(diabetes_patient_params)

    respond_to do |format|
      if @diabetes_patient.save
        format.html { redirect_to @diabetes_patient, notice: 'Diabetes patient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diabetes_patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @diabetes_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diabetes_patients/1
  # PATCH/PUT /diabetes_patients/1.json
  def update
    respond_to do |format|
      if @diabetes_patient.update(diabetes_patient_params)
        format.html { redirect_to @diabetes_patient, notice: 'Diabetes patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diabetes_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diabetes_patients/1
  # DELETE /diabetes_patients/1.json
  def destroy
    @diabetes_patient.destroy
    respond_to do |format|
      format.html { redirect_to diabetes_patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diabetes_patient
      @diabetes_patient = DiabetesPatient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diabetes_patient_params
      params.require(:diabetes_patient).permit(:oracle_id)
    end
end
