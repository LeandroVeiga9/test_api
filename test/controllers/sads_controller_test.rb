require "test_helper"

class SadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sad = sads(:one)
  end

  test "should get index" do
    get sads_url, as: :json
    assert_response :success
  end

  test "should create sad" do
    assert_difference('Sad.count') do
      post sads_url, params: { sad: { name: @sad.name } }, as: :json
    end

    assert_response 201
  end

  test "should show sad" do
    get sad_url(@sad), as: :json
    assert_response :success
  end

  test "should update sad" do
    patch sad_url(@sad), params: { sad: { name: @sad.name } }, as: :json
    assert_response 200
  end

  test "should destroy sad" do
    assert_difference('Sad.count', -1) do
      delete sad_url(@sad), as: :json
    end

    assert_response 204
  end
end
