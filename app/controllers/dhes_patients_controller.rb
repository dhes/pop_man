class DhesPatientsController < ApplicationController
  before_action :set_dhes_patient, only: [:show, :edit, :update, :destroy]

  # GET /dhes_patients
  # GET /dhes_patients.json
  def index
    @dhes_patients = DhesPatient.all
  end

  # GET /dhes_patients/1
  # GET /dhes_patients/1.json
  def show
  end

  # GET /dhes_patients/new
  def new
    @dhes_patient = DhesPatient.new
  end

  # GET /dhes_patients/1/edit
  def edit
  end

  # POST /dhes_patients
  # POST /dhes_patients.json
  def create
    @dhes_patient = DhesPatient.new(dhes_patient_params)

    respond_to do |format|
      if @dhes_patient.save
        format.html { redirect_to @dhes_patient, notice: 'Dhes patient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dhes_patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @dhes_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dhes_patients/1
  # PATCH/PUT /dhes_patients/1.json
  def update
    respond_to do |format|
      if @dhes_patient.update(dhes_patient_params)
        format.html { redirect_to @dhes_patient, notice: 'Dhes patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dhes_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dhes_patients/1
  # DELETE /dhes_patients/1.json
  def destroy
    @dhes_patient.destroy
    respond_to do |format|
      format.html { redirect_to dhes_patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dhes_patient
      @dhes_patient = DhesPatient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dhes_patient_params
      params.require(:dhes_patient).permit(:pid, :searchname, :age_months, :sex, :last_seen)
    end
end
