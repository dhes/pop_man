require 'test_helper'

class ChrtrulesControllerTest < ActionController::TestCase
  setup do
    @chrtrule = chrtrules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chrtrules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chrtrule" do
    assert_difference('Chrtrule.count') do
      post :create, chrtrule: { name: @chrtrule.name, rulecomment: @chrtrule.rulecomment }
    end

    assert_redirected_to chrtrule_path(assigns(:chrtrule))
  end

  test "should show chrtrule" do
    get :show, id: @chrtrule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chrtrule
    assert_response :success
  end

  test "should update chrtrule" do
    patch :update, id: @chrtrule, chrtrule: { name: @chrtrule.name, rulecomment: @chrtrule.rulecomment }
    assert_redirected_to chrtrule_path(assigns(:chrtrule))
  end

  test "should destroy chrtrule" do
    assert_difference('Chrtrule.count', -1) do
      delete :destroy, id: @chrtrule
    end

    assert_redirected_to chrtrules_path
  end
end
