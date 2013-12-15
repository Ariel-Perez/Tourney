require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get accept" do
    get :accept
    assert_response :success
  end

  test "should get decline" do
    get :decline
    assert_response :success
  end

end
