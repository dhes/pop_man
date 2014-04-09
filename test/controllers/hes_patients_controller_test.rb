require 'test_helper'

class HesPatientsControllerTest < ActionController::TestCase
  setup do
    @hes_patient = hes_patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hes_patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hes_patient" do
    assert_difference('HesPatient.count') do
      post :create, hes_patient: { age: @hes_patient.age, gender: @hes_patient.gender, last_seen: @hes_patient.last_seen, name: @hes_patient.name }
    end

    assert_redirected_to hes_patient_path(assigns(:hes_patient))
  end

  test "should show hes_patient" do
    get :show, id: @hes_patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hes_patient
    assert_response :success
  end

  test "should update hes_patient" do
    patch :update, id: @hes_patient, hes_patient: { age: @hes_patient.age, gender: @hes_patient.gender, last_seen: @hes_patient.last_seen, name: @hes_patient.name }
    assert_redirected_to hes_patient_path(assigns(:hes_patient))
  end

  test "should destroy hes_patient" do
    assert_difference('HesPatient.count', -1) do
      delete :destroy, id: @hes_patient
    end

    assert_redirected_to hes_patients_path
  end
end
