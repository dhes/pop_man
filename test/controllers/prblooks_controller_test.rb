require 'test_helper'

class PrblooksControllerTest < ActionController::TestCase
  setup do
    @prblook = prblooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prblooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prblook" do
    assert_difference('Prblook.count') do
      post :create, prblook: { codetype: @prblook.codetype, description: @prblook.description, keyword: @prblook.keyword, longdescr: @prblook.longdescr, mlcode: @prblook.mlcode, standard: @prblook.standard }
    end

    assert_redirected_to prblook_path(assigns(:prblook))
  end

  test "should show prblook" do
    get :show, id: @prblook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prblook
    assert_response :success
  end

  test "should update prblook" do
    patch :update, id: @prblook, prblook: { codetype: @prblook.codetype, description: @prblook.description, keyword: @prblook.keyword, longdescr: @prblook.longdescr, mlcode: @prblook.mlcode, standard: @prblook.standard }
    assert_redirected_to prblook_path(assigns(:prblook))
  end

  test "should destroy prblook" do
    assert_difference('Prblook.count', -1) do
      delete :destroy, id: @prblook
    end

    assert_redirected_to prblooks_path
  end
end
