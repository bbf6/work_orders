require "test_helper"

class WorkStatusTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_status_type = work_status_types(:one)
  end

  test "should get index" do
    get work_status_types_url, as: :json
    assert_response :success
  end

  test "should create work_status_type" do
    assert_difference("WorkStatusType.count") do
      post work_status_types_url, params: { work_status_type: { description: @work_status_type.description, status: @work_status_type.status } }, as: :json
    end

    assert_response :created
  end

  test "should show work_status_type" do
    get work_status_type_url(@work_status_type), as: :json
    assert_response :success
  end

  test "should update work_status_type" do
    patch work_status_type_url(@work_status_type), params: { work_status_type: { description: @work_status_type.description, status: @work_status_type.status } }, as: :json
    assert_response :success
  end

  test "should destroy work_status_type" do
    assert_difference("WorkStatusType.count", -1) do
      delete work_status_type_url(@work_status_type), as: :json
    end

    assert_response :no_content
  end
end
