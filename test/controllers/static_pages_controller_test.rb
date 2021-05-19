require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
  @base_title = "Amazing Website"
  end
  
  test "should get home" do
    get static_pages_home_url
    assert respose :success
  end
  
end
