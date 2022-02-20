require "test_helper"

class ClientBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_branch = client_branches(:one)
  end

  test "should get index" do
    get client_branches_url, as: :json
    assert_response :success
  end

  test "should create client_branch" do
    assert_difference("ClientBranch.count") do
      post client_branches_url, params: { client_branch: { address: @client_branch.address, client_id: @client_branch.client_id, client_manager_id: @client_branch.client_manager_id, email: @client_branch.email, status: @client_branch.status } }, as: :json
    end

    assert_response :created
  end

  test "should show client_branch" do
    get client_branch_url(@client_branch), as: :json
    assert_response :success
  end

  test "should update client_branch" do
    patch client_branch_url(@client_branch), params: { client_branch: { address: @client_branch.address, client_id: @client_branch.client_id, client_manager_id: @client_branch.client_manager_id, email: @client_branch.email, status: @client_branch.status } }, as: :json
    assert_response :success
  end

  test "should destroy client_branch" do
    assert_difference("ClientBranch.count", -1) do
      delete client_branch_url(@client_branch), as: :json
    end

    assert_response :no_content
  end
end
