require "test_helper"

class ThecnicianPhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thecnician_phone = thecnician_phones(:one)
  end

  test "should get index" do
    get thecnician_phones_url, as: :json
    assert_response :success
  end

  test "should create thecnician_phone" do
    assert_difference("ThecnicianPhone.count") do
      post thecnician_phones_url, params: { thecnician_phone: { description: @thecnician_phone.description, number: @thecnician_phone.number, status: @thecnician_phone.status, thecnician_id: @thecnician_phone.thecnician_id } }, as: :json
    end

    assert_response :created
  end

  test "should show thecnician_phone" do
    get thecnician_phone_url(@thecnician_phone), as: :json
    assert_response :success
  end

  test "should update thecnician_phone" do
    patch thecnician_phone_url(@thecnician_phone), params: { thecnician_phone: { description: @thecnician_phone.description, number: @thecnician_phone.number, status: @thecnician_phone.status, thecnician_id: @thecnician_phone.thecnician_id } }, as: :json
    assert_response :success
  end

  test "should destroy thecnician_phone" do
    assert_difference("ThecnicianPhone.count", -1) do
      delete thecnician_phone_url(@thecnician_phone), as: :json
    end

    assert_response :no_content
  end
end
