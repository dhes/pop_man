require 'test_helper'

class DhesPatientsControllerTest < ActionController::TestCase
  setup do
    @dhes_patient = dhes_patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dhes_patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dhes_patient" do
    assert_difference('DhesPatient.count') do
      post :create, dhes_patient: { age_months: @dhes_patient.age_months, last_seen: @dhes_patient.last_seen, pid: @dhes_patient.pid, searchname: @dhes_patient.searchname, sex: @dhes_patient.sex }
    end

    assert_redirected_to dhes_patient_path(assigns(:dhes_patient))
  end

  test "should show dhes_patient" do
    get :show, id: @dhes_patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dhes_patient
    assert_response :success
  end

  test "should update dhes_patient" do
    patch :update, id: @dhes_patient, dhes_patient: { age_months: @dhes_patient.age_months, last_seen: @dhes_patient.last_seen, pid: @dhes_patient.pid, searchname: @dhes_patient.searchname, sex: @dhes_patient.sex }
    assert_redirected_to dhes_patient_path(assigns(:dhes_patient))
  end

  test "should destroy dhes_patient" do
    assert_difference('DhesPatient.count', -1) do
      delete :destroy, id: @dhes_patient
    end

    assert_redirected_to dhes_patients_path
  end
end
