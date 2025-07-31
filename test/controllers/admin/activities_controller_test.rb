require "test_helper"

class Admin::ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_activities_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_activities_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_activities_destroy_url
    assert_response :success
  end
end
