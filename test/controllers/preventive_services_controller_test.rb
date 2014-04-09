require 'test_helper'

class PreventiveServicesControllerTest < ActionController::TestCase
  setup do
    @preventive_service = preventive_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preventive_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preventive_service" do
    assert_difference('PreventiveService.count') do
      post :create, preventive_service: { in_scope: @preventive_service.in_scope, name: @preventive_service.name, rule: @preventive_service.rule, source: @preventive_service.source }
    end

    assert_redirected_to preventive_service_path(assigns(:preventive_service))
  end

  test "should show preventive_service" do
    get :show, id: @preventive_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @preventive_service
    assert_response :success
  end

  test "should update preventive_service" do
    patch :update, id: @preventive_service, preventive_service: { in_scope: @preventive_service.in_scope, name: @preventive_service.name, rule: @preventive_service.rule, source: @preventive_service.source }
    assert_redirected_to preventive_service_path(assigns(:preventive_service))
  end

  test "should destroy preventive_service" do
    assert_difference('PreventiveService.count', -1) do
      delete :destroy, id: @preventive_service
    end

    assert_redirected_to preventive_services_path
  end
end
