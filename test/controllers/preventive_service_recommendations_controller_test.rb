require 'test_helper'

class PreventiveServiceRecommendationsControllerTest < ActionController::TestCase
  setup do
    @preventive_service_recommendation = preventive_service_recommendations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preventive_service_recommendations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preventive_service_recommendation" do
    assert_difference('PreventiveServiceRecommendation.count') do
      post :create, preventive_service_recommendation: { description: @preventive_service_recommendation.description, implemented?: @preventive_service_recommendation.implemented?, in_scope?: @preventive_service_recommendation.in_scope?, source: @preventive_service_recommendation.source, title: @preventive_service_recommendation.title }
    end

    assert_redirected_to preventive_service_recommendation_path(assigns(:preventive_service_recommendation))
  end

  test "should show preventive_service_recommendation" do
    get :show, id: @preventive_service_recommendation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @preventive_service_recommendation
    assert_response :success
  end

  test "should update preventive_service_recommendation" do
    patch :update, id: @preventive_service_recommendation, preventive_service_recommendation: { description: @preventive_service_recommendation.description, implemented?: @preventive_service_recommendation.implemented?, in_scope?: @preventive_service_recommendation.in_scope?, source: @preventive_service_recommendation.source, title: @preventive_service_recommendation.title }
    assert_redirected_to preventive_service_recommendation_path(assigns(:preventive_service_recommendation))
  end

  test "should destroy preventive_service_recommendation" do
    assert_difference('PreventiveServiceRecommendation.count', -1) do
      delete :destroy, id: @preventive_service_recommendation
    end

    assert_redirected_to preventive_service_recommendations_path
  end
end
