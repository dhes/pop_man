class HesPatientsController < ApplicationController
  before_action :set_hes_patient, only: [:show, :edit, :update, :destroy]

  # GET /hes_patients
  # GET /hes_patients.json
  def index
    @hes_patients = HesPatient.all
  end

  # GET /hes_patients/1
  # GET /hes_patients/1.json
  def show
  end

  # GET /hes_patients/new
  def new
    @hes_patient = HesPatient.new
  end

  # GET /hes_patients/1/edit
  def edit
  end

  # POST /hes_patients
  # POST /hes_patients.json
  def create
    @hes_patient = HesPatient.new(hes_patient_params)

    respond_to do |format|
      if @hes_patient.save
        format.html { redirect_to @hes_patient, notice: 'Hes patient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hes_patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @hes_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hes_patients/1
  # PATCH/PUT /hes_patients/1.json
  def update
    respond_to do |format|
      if @hes_patient.update(hes_patient_params)
        format.html { redirect_to @hes_patient, notice: 'Hes patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hes_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hes_patients/1
  # DELETE /hes_patients/1.json
  def destroy
    @hes_patient.destroy
    respond_to do |format|
      format.html { redirect_to hes_patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hes_patient
      @hes_patient = HesPatient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hes_patient_params
      params.require(:hes_patient).permit(:name, :age, :gender, :last_seen)
    end
end
