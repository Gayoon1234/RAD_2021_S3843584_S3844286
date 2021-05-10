require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
   @customer = Customer.new(username: "Test Customer", email: "customer@myapp.com",
   password: "test123", password_confirmation: "test123")
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
  
  
  test "good emails should pass" do
   # A list of valid emails
    valid_emails = %w[joe@apple.com TEST@EXP.ORG joe_s@a-School.net
                   alex.smith@topshop.biz don+z@136.co]
    valid_emails.each do |email|
     @customer.email = email
     assert @customer.valid?, "#{email.inspect} should be valid"
    end
  end
  
  
 test "bad emails should be rejected" do
   invalid_emails = %w[joe@apple,com TEST@@EXP.ORG joe_s@a_School.net
   alex.smith@top shop.biz don+z@13+6.co]
   invalid_emails.each do | email |
    @customer.email = email
    assert_not @customer.valid?, "#{email.inspect} should be invalid"
  end
 end
  
 test "email addresses should be unique" do
   clone = @customer.dup
   clone.email = @customer.email.upcase
   @customer.save
   assert_not clone.valid?
 end 
 
 test "email addresses should be saved as lower-case" do
   mixed_case_email = "Joe@RAd.oRg.AU"
   @customer.email = mixed_case_email
   @customer.save
   assert_equal mixed_case_email.downcase, @customer.reload.email
 end
 
  test "password cannot blank" do
   @customer.password = @customer.password_confirmation = " " * 6
   assert_not @customer.valid?
 end
 
 test "password should be longer than 6 chars" do
   @customer.password = @customer.password_confirmation = "x" * 5
   assert_not @customer.valid?
 end
 
 
  
end
