require "test_helper"

class IusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iu = ius(:one)
  end

  test "should get index" do
    get ius_url, as: :json
    assert_response :success
  end

  test "should create iu" do
    assert_difference('Iu.count') do
      post ius_url, params: { iu: { name: @iu.name } }, as: :json
    end

    assert_response 201
  end

  test "should show iu" do
    get iu_url(@iu), as: :json
    assert_response :success
  end

  test "should update iu" do
    patch iu_url(@iu), params: { iu: { name: @iu.name } }, as: :json
    assert_response 200
  end

  test "should destroy iu" do
    assert_difference('Iu.count', -1) do
      delete iu_url(@iu), as: :json
    end

    assert_response 204
  end
end
