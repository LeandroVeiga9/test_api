require "test_helper"

class QwesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qwe = qwes(:one)
  end

  test "should get index" do
    get qwes_url, as: :json
    assert_response :success
  end

  test "should create qwe" do
    assert_difference('Qwe.count') do
      post qwes_url, params: { qwe: { name: @qwe.name } }, as: :json
    end

    assert_response 201
  end

  test "should show qwe" do
    get qwe_url(@qwe), as: :json
    assert_response :success
  end

  test "should update qwe" do
    patch qwe_url(@qwe), params: { qwe: { name: @qwe.name } }, as: :json
    assert_response 200
  end

  test "should destroy qwe" do
    assert_difference('Qwe.count', -1) do
      delete qwe_url(@qwe), as: :json
    end

    assert_response 204
  end
end
