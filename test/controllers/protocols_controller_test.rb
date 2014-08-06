require 'test_helper'

class ProtocolsControllerTest < ActionController::TestCase
  setup do
    @protocol = protocols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:protocols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create protocol" do
    assert_difference('Protocol.count') do
      post :create, protocol: { fact: @protocol.fact, highage: @protocol.highage, lowage: @protocol.lowage, medications: @protocol.medications, name: @protocol.name, problems: @protocol.problems, sex: @protocol.sex, tests: @protocol.tests }
    end

    assert_redirected_to protocol_path(assigns(:protocol))
  end

  test "should show protocol" do
    get :show, id: @protocol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @protocol
    assert_response :success
  end

  test "should update protocol" do
    patch :update, id: @protocol, protocol: { fact: @protocol.fact, highage: @protocol.highage, lowage: @protocol.lowage, medications: @protocol.medications, name: @protocol.name, problems: @protocol.problems, sex: @protocol.sex, tests: @protocol.tests }
    assert_redirected_to protocol_path(assigns(:protocol))
  end

  test "should destroy protocol" do
    assert_difference('Protocol.count', -1) do
      delete :destroy, id: @protocol
    end

    assert_redirected_to protocols_path
  end
end
