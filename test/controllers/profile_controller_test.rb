require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get profile_show_url
    assert_response :success
  end

  test "should get subscription" do
    get profile_subscription_url
    assert_response :success
  end

  test "should get updateDetails" do
    get profile_updateDetails_url
    assert_response :success
  end

  test "should get pendingOrders" do
    get profile_pendingOrders_url
    assert_response :success
  end

end
