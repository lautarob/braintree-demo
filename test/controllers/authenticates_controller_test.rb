require "test_helper"

class AuthenticatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authenticate = authenticates(:one)
  end

  test "should get index" do
    get authenticates_url, as: :json
    assert_response :success
  end

  test "should create authenticate" do
    assert_difference("Authenticate.count") do
      post authenticates_url, params: { authenticate: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show authenticate" do
    get authenticate_url(@authenticate), as: :json
    assert_response :success
  end

  test "should update authenticate" do
    patch authenticate_url(@authenticate), params: { authenticate: {  } }, as: :json
    assert_response :success
  end

  test "should destroy authenticate" do
    assert_difference("Authenticate.count", -1) do
      delete authenticate_url(@authenticate), as: :json
    end

    assert_response :no_content
  end
end
