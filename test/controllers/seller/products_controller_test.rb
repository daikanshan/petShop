require 'test_helper'

class Seller::ProductsControllerTest < ActionController::TestCase
  setup do
    @seller_product = seller_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seller_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller_product" do
    assert_difference('Seller::Product.count') do
      post :create, seller_product: { img_url: @seller_product.img_url, name: @seller_product.name, price: @seller_product.price, verified: @seller_product.verified }
    end

    assert_redirected_to seller_product_path(assigns(:seller_product))
  end

  test "should show seller_product" do
    get :show, id: @seller_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seller_product
    assert_response :success
  end

  test "should update seller_product" do
    patch :update, id: @seller_product, seller_product: { img_url: @seller_product.img_url, name: @seller_product.name, price: @seller_product.price, verified: @seller_product.verified }
    assert_redirected_to seller_product_path(assigns(:seller_product))
  end

  test "should destroy seller_product" do
    assert_difference('Seller::Product.count', -1) do
      delete :destroy, id: @seller_product
    end

    assert_redirected_to seller_products_path
  end
end
