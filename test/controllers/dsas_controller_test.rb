require "test_helper"

class DsasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dsa = dsas(:one)
  end

  test "should get index" do
    get dsas_url, as: :json
    assert_response :success
  end

  test "should create dsa" do
    assert_difference('Dsa.count') do
      post dsas_url, params: { dsa: { name: @dsa.name } }, as: :json
    end

    assert_response 201
  end

  test "should show dsa" do
    get dsa_url(@dsa), as: :json
    assert_response :success
  end

  test "should update dsa" do
    patch dsa_url(@dsa), params: { dsa: { name: @dsa.name } }, as: :json
    assert_response 200
  end

  test "should destroy dsa" do
    assert_difference('Dsa.count', -1) do
      delete dsa_url(@dsa), as: :json
    end

    assert_response 204
  end
end
