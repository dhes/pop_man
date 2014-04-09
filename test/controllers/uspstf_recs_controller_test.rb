require 'test_helper'

class UspstfRecsControllerTest < ActionController::TestCase
  setup do
    @uspstf_rec = uspstf_recs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uspstf_recs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uspstf_rec" do
    assert_difference('UspstfRec.count') do
      post :create, uspstf_rec: { description: @uspstf_rec.description, grade: @uspstf_rec.grade, release_date: @uspstf_rec.release_date, topic: @uspstf_rec.topic }
    end

    assert_redirected_to uspstf_rec_path(assigns(:uspstf_rec))
  end

  test "should show uspstf_rec" do
    get :show, id: @uspstf_rec
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uspstf_rec
    assert_response :success
  end

  test "should update uspstf_rec" do
    patch :update, id: @uspstf_rec, uspstf_rec: { description: @uspstf_rec.description, grade: @uspstf_rec.grade, release_date: @uspstf_rec.release_date, topic: @uspstf_rec.topic }
    assert_redirected_to uspstf_rec_path(assigns(:uspstf_rec))
  end

  test "should destroy uspstf_rec" do
    assert_difference('UspstfRec.count', -1) do
      delete :destroy, id: @uspstf_rec
    end

    assert_redirected_to uspstf_recs_path
  end
end
