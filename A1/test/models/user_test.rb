require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
 @customer = Customer.new(username: "Test Customer", email: "customer@myapp.com")
 end
 test "should be valid" do
 assert @customer.valid?
 end
 
 test "name should be present" do
 @customer.username = " "
 assert_not @customer.valid?
 end
 
 test "email should be present" do
 @customer.email = " "
 assert_not @customer.valid?
 end
  
end
