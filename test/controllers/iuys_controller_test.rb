require "test_helper"

class IuysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iuy = iuys(:one)
  end

  test "should get index" do
    get iuys_url, as: :json
    assert_response :success
  end

  test "should create iuy" do
    assert_difference('Iuy.count') do
      post iuys_url, params: { iuy: { name: @iuy.name } }, as: :json
    end

    assert_response 201
  end

  test "should show iuy" do
    get iuy_url(@iuy), as: :json
    assert_response :success
  end

  test "should update iuy" do
    patch iuy_url(@iuy), params: { iuy: { name: @iuy.name } }, as: :json
    assert_response 200
  end

  test "should destroy iuy" do
    assert_difference('Iuy.count', -1) do
      delete iuy_url(@iuy), as: :json
    end

    assert_response 204
  end
end
