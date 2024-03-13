require "test_helper"

class AsdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asd = asds(:one)
  end

  test "should get index" do
    get asds_url, as: :json
    assert_response :success
  end

  test "should create asd" do
    assert_difference('Asd.count') do
      post asds_url, params: { asd: { name: @asd.name } }, as: :json
    end

    assert_response 201
  end

  test "should show asd" do
    get asd_url(@asd), as: :json
    assert_response :success
  end

  test "should update asd" do
    patch asd_url(@asd), params: { asd: { name: @asd.name } }, as: :json
    assert_response 200
  end

  test "should destroy asd" do
    assert_difference('Asd.count', -1) do
      delete asd_url(@asd), as: :json
    end

    assert_response 204
  end
end
