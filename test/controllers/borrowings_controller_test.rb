require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get borrowings_create_url
    assert_response :success
  end

  test "should get return" do
    get borrowings_return_url
    assert_response :success
  end

  test "should get show" do
    get borrowings_show_url
    assert_response :success
  end
end
