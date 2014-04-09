require 'test_helper'

class PmScoresControllerTest < ActionController::TestCase
  setup do
    @pm_score = pm_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pm_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pm_score" do
    assert_difference('PmScore.count') do
      post :create, pm_score: { denom: @pm_score.denom, measure: @pm_score.measure, numer: @pm_score.numer, score: @pm_score.score, score_date: @pm_score.score_date }
    end

    assert_redirected_to pm_score_path(assigns(:pm_score))
  end

  test "should show pm_score" do
    get :show, id: @pm_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pm_score
    assert_response :success
  end

  test "should update pm_score" do
    patch :update, id: @pm_score, pm_score: { denom: @pm_score.denom, measure: @pm_score.measure, numer: @pm_score.numer, score: @pm_score.score, score_date: @pm_score.score_date }
    assert_redirected_to pm_score_path(assigns(:pm_score))
  end

  test "should destroy pm_score" do
    assert_difference('PmScore.count', -1) do
      delete :destroy, id: @pm_score
    end

    assert_redirected_to pm_scores_path
  end
end
