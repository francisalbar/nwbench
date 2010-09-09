require 'test_helper'

class ToonsControllerTest < ActionController::TestCase
  setup do
    @toon = toons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:toons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create toon" do
    assert_difference('Toon.count') do
      post :create, :toon => @toon.attributes
    end

    assert_redirected_to toon_path(assigns(:toon))
  end

  test "should show toon" do
    get :show, :id => @toon.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @toon.to_param
    assert_response :success
  end

  test "should update toon" do
    put :update, :id => @toon.to_param, :toon => @toon.attributes
    assert_redirected_to toon_path(assigns(:toon))
  end

  test "should destroy toon" do
    assert_difference('Toon.count', -1) do
      delete :destroy, :id => @toon.to_param
    end

    assert_redirected_to toons_path
  end
end
