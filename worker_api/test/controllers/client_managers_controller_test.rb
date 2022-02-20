require "test_helper"

class ClientManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_manager = client_managers(:one)
  end

  test "should get index" do
    get client_managers_url, as: :json
    assert_response :success
  end

  test "should create client_manager" do
    assert_difference("ClientManager.count") do
      post client_managers_url, params: { client_manager: { last_name: @client_manager.last_name, mother_last_name: @client_manager.mother_last_name, name: @client_manager.name, status: @client_manager.status } }, as: :json
    end

    assert_response :created
  end

  test "should show client_manager" do
    get client_manager_url(@client_manager), as: :json
    assert_response :success
  end

  test "should update client_manager" do
    patch client_manager_url(@client_manager), params: { client_manager: { last_name: @client_manager.last_name, mother_last_name: @client_manager.mother_last_name, name: @client_manager.name, status: @client_manager.status } }, as: :json
    assert_response :success
  end

  test "should destroy client_manager" do
    assert_difference("ClientManager.count", -1) do
      delete client_manager_url(@client_manager), as: :json
    end

    assert_response :no_content
  end
end
