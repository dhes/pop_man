require 'test_helper'

class MostRecentObservationsControllerTest < ActionController::TestCase
  setup do
    @most_recent_observation = most_recent_observations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:most_recent_observations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create most_recent_observation" do
    assert_difference('MostRecentObservation.count') do
      post :create, most_recent_observation: { hdid: @most_recent_observation.hdid, obsdate: @most_recent_observation.obsdate, obsvalue: @most_recent_observation.obsvalue, pid: @most_recent_observation.pid }
    end

    assert_redirected_to most_recent_observation_path(assigns(:most_recent_observation))
  end

  test "should show most_recent_observation" do
    get :show, id: @most_recent_observation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @most_recent_observation
    assert_response :success
  end

  test "should update most_recent_observation" do
    patch :update, id: @most_recent_observation, most_recent_observation: { hdid: @most_recent_observation.hdid, obsdate: @most_recent_observation.obsdate, obsvalue: @most_recent_observation.obsvalue, pid: @most_recent_observation.pid }
    assert_redirected_to most_recent_observation_path(assigns(:most_recent_observation))
  end

  test "should destroy most_recent_observation" do
    assert_difference('MostRecentObservation.count', -1) do
      delete :destroy, id: @most_recent_observation
    end

    assert_redirected_to most_recent_observations_path
  end
end
