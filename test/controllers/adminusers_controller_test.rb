require 'test_helper'

class AdminusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminusers_index_url
    assert_response :success
  end

  test "should get new" do
    get adminusers_new_url
    assert_response :success
  end

  test "should get edit" do
    get adminusers_edit_url
    assert_response :success
  end

  test "should get show" do
    get adminusers_show_url
    assert_response :success
  end

end
