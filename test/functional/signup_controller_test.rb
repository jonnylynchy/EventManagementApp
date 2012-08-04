require 'test_helper'

class SignupControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get account" do
    get :account
    assert_response :success
  end

  test "should get payment" do
    get :payment
    assert_response :success
  end

  test "should get user" do
    get :user
    assert_response :success
  end

end
