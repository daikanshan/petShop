require 'test_helper'

class Seller::OrderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
