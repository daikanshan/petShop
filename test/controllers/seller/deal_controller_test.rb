require 'test_helper'

class Seller::DealControllerTest < ActionController::TestCase
  test "should get result" do
    get :result
    assert_response :success
  end

  test "should get sendout" do
    get :sendout
    assert_response :success
  end

end
