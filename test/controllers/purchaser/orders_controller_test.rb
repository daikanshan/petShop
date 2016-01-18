require 'test_helper'

class Purchaser::OrdersControllerTest < ActionController::TestCase
  setup do
    @purchaser_order = purchaser_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchaser_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchaser_order" do
    assert_difference('Purchaser::Order.count') do
      post :create, purchaser_order: {  }
    end

    assert_redirected_to purchaser_order_path(assigns(:purchaser_order))
  end

  test "should show purchaser_order" do
    get :show, id: @purchaser_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchaser_order
    assert_response :success
  end

  test "should update purchaser_order" do
    patch :update, id: @purchaser_order, purchaser_order: {  }
    assert_redirected_to purchaser_order_path(assigns(:purchaser_order))
  end

  test "should destroy purchaser_order" do
    assert_difference('Purchaser::Order.count', -1) do
      delete :destroy, id: @purchaser_order
    end

    assert_redirected_to purchaser_orders_path
  end
end
