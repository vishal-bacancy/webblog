require 'test_helper'

class AdminblogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get adminblogs_new_url
    assert_response :success
  end

  test "should get edit" do
    get adminblogs_edit_url
    assert_response :success
  end

  test "should get index" do
    get adminblogs_index_url
    assert_response :success
  end

  test "should get show" do
    get adminblogs_show_url
    assert_response :success
  end

end
