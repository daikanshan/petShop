require 'test_helper'

class Purchaser::ListsControllerTest < ActionController::TestCase
  setup do
    @purchaser_list = purchaser_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchaser_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchaser_list" do
    assert_difference('Purchaser::List.count') do
      post :create, purchaser_list: {  }
    end

    assert_redirected_to purchaser_list_path(assigns(:purchaser_list))
  end

  test "should show purchaser_list" do
    get :show, id: @purchaser_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchaser_list
    assert_response :success
  end

  test "should update purchaser_list" do
    patch :update, id: @purchaser_list, purchaser_list: {  }
    assert_redirected_to purchaser_list_path(assigns(:purchaser_list))
  end

  test "should destroy purchaser_list" do
    assert_difference('Purchaser::List.count', -1) do
      delete :destroy, id: @purchaser_list
    end

    assert_redirected_to purchaser_lists_path
  end
end
