require 'test_helper'

class DiabetesPatientsControllerTest < ActionController::TestCase
  setup do
    @diabetes_patient = diabetes_patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diabetes_patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diabetes_patient" do
    assert_difference('DiabetesPatient.count') do
      post :create, diabetes_patient: { oracle_id: @diabetes_patient.oracle_id }
    end

    assert_redirected_to diabetes_patient_path(assigns(:diabetes_patient))
  end

  test "should show diabetes_patient" do
    get :show, id: @diabetes_patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diabetes_patient
    assert_response :success
  end

  test "should update diabetes_patient" do
    patch :update, id: @diabetes_patient, diabetes_patient: { oracle_id: @diabetes_patient.oracle_id }
    assert_redirected_to diabetes_patient_path(assigns(:diabetes_patient))
  end

  test "should destroy diabetes_patient" do
    assert_difference('DiabetesPatient.count', -1) do
      delete :destroy, id: @diabetes_patient
    end

    assert_redirected_to diabetes_patients_path
  end
end
