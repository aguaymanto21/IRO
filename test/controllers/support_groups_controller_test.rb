require "test_helper"

class SupportGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get support_groups_new_url
    assert_response :success
  end

  test "should get create" do
    get support_groups_create_url
    assert_response :success
  end

  test "should get destroy" do
    get support_groups_destroy_url
    assert_response :success
  end
end
