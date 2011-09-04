require 'test_helper'

class InksControllerTest < ActionController::TestCase
  setup do
    @ink = inks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ink" do
    assert_difference('Ink.count') do
      post :create, :ink => @ink.attributes
    end

    assert_redirected_to ink_path(assigns(:ink))
  end

  test "should show ink" do
    get :show, :id => @ink.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ink.to_param
    assert_response :success
  end

  test "should update ink" do
    put :update, :id => @ink.to_param, :ink => @ink.attributes
    assert_redirected_to ink_path(assigns(:ink))
  end

  test "should destroy ink" do
    assert_difference('Ink.count', -1) do
      delete :destroy, :id => @ink.to_param
    end

    assert_redirected_to inks_path
  end
end
