require "test_helper"

class ClientManagerPhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_manager_phone = client_manager_phones(:one)
  end

  test "should get index" do
    get client_manager_phones_url, as: :json
    assert_response :success
  end

  test "should create client_manager_phone" do
    assert_difference("ClientManagerPhone.count") do
      post client_manager_phones_url, params: { client_manager_phone: { client_manager_id: @client_manager_phone.client_manager_id, description: @client_manager_phone.description, number: @client_manager_phone.number, status: @client_manager_phone.status } }, as: :json
    end

    assert_response :created
  end

  test "should show client_manager_phone" do
    get client_manager_phone_url(@client_manager_phone), as: :json
    assert_response :success
  end

  test "should update client_manager_phone" do
    patch client_manager_phone_url(@client_manager_phone), params: { client_manager_phone: { client_manager_id: @client_manager_phone.client_manager_id, description: @client_manager_phone.description, number: @client_manager_phone.number, status: @client_manager_phone.status } }, as: :json
    assert_response :success
  end

  test "should destroy client_manager_phone" do
    assert_difference("ClientManagerPhone.count", -1) do
      delete client_manager_phone_url(@client_manager_phone), as: :json
    end

    assert_response :no_content
  end
end
