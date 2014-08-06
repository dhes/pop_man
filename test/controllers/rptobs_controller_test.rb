require 'test_helper'

class RptobsControllerTest < ActionController::TestCase
  setup do
    @rptob = rptobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rptobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rptob" do
    assert_difference('Rptob.count') do
      post :create, rptob: { change: @rptob.change, hdid: @rptob.hdid, obsdate: @rptob.obsdate, obsvalue: @rptob.obsvalue, pid: @rptob.pid }
    end

    assert_redirected_to rptob_path(assigns(:rptob))
  end

  test "should show rptob" do
    get :show, id: @rptob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rptob
    assert_response :success
  end

  test "should update rptob" do
    patch :update, id: @rptob, rptob: { change: @rptob.change, hdid: @rptob.hdid, obsdate: @rptob.obsdate, obsvalue: @rptob.obsvalue, pid: @rptob.pid }
    assert_redirected_to rptob_path(assigns(:rptob))
  end

  test "should destroy rptob" do
    assert_difference('Rptob.count', -1) do
      delete :destroy, id: @rptob
    end

    assert_redirected_to rptobs_path
  end
end
