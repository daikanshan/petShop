require 'test_helper'

class Purchaser::CartsControllerTest < ActionController::TestCase
  setup do
    @purchaser_cart = purchaser_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchaser_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchaser_cart" do
    assert_difference('Purchaser::Cart.count') do
      post :create, purchaser_cart: {  }
    end

    assert_redirected_to purchaser_cart_path(assigns(:purchaser_cart))
  end

  test "should show purchaser_cart" do
    get :show, id: @purchaser_cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchaser_cart
    assert_response :success
  end

  test "should update purchaser_cart" do
    patch :update, id: @purchaser_cart, purchaser_cart: {  }
    assert_redirected_to purchaser_cart_path(assigns(:purchaser_cart))
  end

  test "should destroy purchaser_cart" do
    assert_difference('Purchaser::Cart.count', -1) do
      delete :destroy, id: @purchaser_cart
    end

    assert_redirected_to purchaser_carts_path
  end
end
