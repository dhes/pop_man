require 'test_helper'

class ObsheadsControllerTest < ActionController::TestCase
  setup do
    @obshead = obsheads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obsheads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obshead" do
    assert_difference('Obshead.count') do
      post :create, obshead: { cptcode: @obshead.cptcode, description: @obshead.description, hdid: @obshead.hdid, icdcode: @obshead.icdcode, loinccode: @obshead.loinccode, mlcode: @obshead.mlcode, name: @obshead.name, snomedcode: @obshead.snomedcode }
    end

    assert_redirected_to obshead_path(assigns(:obshead))
  end

  test "should show obshead" do
    get :show, id: @obshead
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @obshead
    assert_response :success
  end

  test "should update obshead" do
    patch :update, id: @obshead, obshead: { cptcode: @obshead.cptcode, description: @obshead.description, hdid: @obshead.hdid, icdcode: @obshead.icdcode, loinccode: @obshead.loinccode, mlcode: @obshead.mlcode, name: @obshead.name, snomedcode: @obshead.snomedcode }
    assert_redirected_to obshead_path(assigns(:obshead))
  end

  test "should destroy obshead" do
    assert_difference('Obshead.count', -1) do
      delete :destroy, id: @obshead
    end

    assert_redirected_to obsheads_path
  end
end
