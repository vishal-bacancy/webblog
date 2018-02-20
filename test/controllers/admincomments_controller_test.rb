require 'test_helper'

class AdmincommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admincomments_new_url
    assert_response :success
  end

  test "should get edit" do
    get admincomments_edit_url
    assert_response :success
  end

  test "should get index" do
    get admincomments_index_url
    assert_response :success
  end

  test "should get show" do
    get admincomments_show_url
    assert_response :success
  end

end
