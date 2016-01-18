require 'test_helper'

class Admin::ApplctsControllerTest < ActionController::TestCase
  setup do
    @admin_applct = admin_applcts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_applcts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_applct" do
    assert_difference('Admin::Applct.count') do
      post :create, admin_applct: { identity: @admin_applct.identity }
    end

    assert_redirected_to admin_applct_path(assigns(:admin_applct))
  end

  test "should show admin_applct" do
    get :show, id: @admin_applct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_applct
    assert_response :success
  end

  test "should update admin_applct" do
    patch :update, id: @admin_applct, admin_applct: { identity: @admin_applct.identity }
    assert_redirected_to admin_applct_path(assigns(:admin_applct))
  end

  test "should destroy admin_applct" do
    assert_difference('Admin::Applct.count', -1) do
      delete :destroy, id: @admin_applct
    end

    assert_redirected_to admin_applcts_path
  end
end
