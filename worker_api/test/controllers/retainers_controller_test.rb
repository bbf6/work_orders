require "test_helper"

class RetainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retainer = retainers(:one)
  end

  test "should get index" do
    get retainers_url, as: :json
    assert_response :success
  end

  test "should create retainer" do
    assert_difference("Retainer.count") do
      post retainers_url, params: { retainer: { service_date: @retainer.service_date, status: @retainer.status, work_order_id: @retainer.work_order_id } }, as: :json
    end

    assert_response :created
  end

  test "should show retainer" do
    get retainer_url(@retainer), as: :json
    assert_response :success
  end

  test "should update retainer" do
    patch retainer_url(@retainer), params: { retainer: { service_date: @retainer.service_date, status: @retainer.status, work_order_id: @retainer.work_order_id } }, as: :json
    assert_response :success
  end

  test "should destroy retainer" do
    assert_difference("Retainer.count", -1) do
      delete retainer_url(@retainer), as: :json
    end

    assert_response :no_content
  end
end
