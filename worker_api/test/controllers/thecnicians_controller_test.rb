require "test_helper"

class ThecniciansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thecnician = thecnicians(:one)
  end

  test "should get index" do
    get thecnicians_url, as: :json
    assert_response :success
  end

  test "should create thecnician" do
    assert_difference("Thecnician.count") do
      post thecnicians_url, params: { thecnician: { birth_date: @thecnician.birth_date, email: @thecnician.email, last_name: @thecnician.last_name, mother_last_name: @thecnician.mother_last_name, name: @thecnician.name, pic: @thecnician.pic, sex: @thecnician.sex, status: @thecnician.status } }, as: :json
    end

    assert_response :created
  end

  test "should show thecnician" do
    get thecnician_url(@thecnician), as: :json
    assert_response :success
  end

  test "should update thecnician" do
    patch thecnician_url(@thecnician), params: { thecnician: { birth_date: @thecnician.birth_date, email: @thecnician.email, last_name: @thecnician.last_name, mother_last_name: @thecnician.mother_last_name, name: @thecnician.name, pic: @thecnician.pic, sex: @thecnician.sex, status: @thecnician.status } }, as: :json
    assert_response :success
  end

  test "should destroy thecnician" do
    assert_difference("Thecnician.count", -1) do
      delete thecnician_url(@thecnician), as: :json
    end

    assert_response :no_content
  end
end
