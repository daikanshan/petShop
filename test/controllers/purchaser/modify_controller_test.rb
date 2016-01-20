require 'test_helper'

class Purchaser::ModifyControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

end
