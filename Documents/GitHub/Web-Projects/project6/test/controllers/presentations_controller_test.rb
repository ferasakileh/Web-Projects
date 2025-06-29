require "test_helper"

class PresentationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get presentations_index_url
    assert_response :success
  end

  test "should get show" do
    get presentations_show_url
    assert_response :success
  end

  test "should get new" do
    get presentations_new_url
    assert_response :success
  end

  test "should get create" do
    get presentations_create_url
    assert_response :success
  end

  test "should get edit" do
    get presentations_edit_url
    assert_response :success
  end

  test "should get update" do
    get presentations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get presentations_destroy_url
    assert_response :success
  end
end
