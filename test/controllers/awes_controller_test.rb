require "test_helper"

class AwesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @awe = awes(:one)
  end

  test "should get index" do
    get awes_url, as: :json
    assert_response :success
  end

  test "should create awe" do
    assert_difference('Awe.count') do
      post awes_url, params: { awe: { name: @awe.name } }, as: :json
    end

    assert_response 201
  end

  test "should show awe" do
    get awe_url(@awe), as: :json
    assert_response :success
  end

  test "should update awe" do
    patch awe_url(@awe), params: { awe: { name: @awe.name } }, as: :json
    assert_response 200
  end

  test "should destroy awe" do
    assert_difference('Awe.count', -1) do
      delete awe_url(@awe), as: :json
    end

    assert_response 204
  end
end
