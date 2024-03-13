require "test_helper"

class IuasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iua = iuas(:one)
  end

  test "should get index" do
    get iuas_url, as: :json
    assert_response :success
  end

  test "should create iua" do
    assert_difference('Iua.count') do
      post iuas_url, params: { iua: { name: @iua.name } }, as: :json
    end

    assert_response 201
  end

  test "should show iua" do
    get iua_url(@iua), as: :json
    assert_response :success
  end

  test "should update iua" do
    patch iua_url(@iua), params: { iua: { name: @iua.name } }, as: :json
    assert_response 200
  end

  test "should destroy iua" do
    assert_difference('Iua.count', -1) do
      delete iua_url(@iua), as: :json
    end

    assert_response 204
  end
end
