require "test_helper"

class AchievementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get achievements_new_url
    assert_response :success
  end

  test "should get create" do
    get achievements_create_url
    assert_response :success
  end

  test "should get edit" do
    get achievements_edit_url
    assert_response :success
  end

  test "should get update" do
    get achievements_update_url
    assert_response :success
  end

  test "should get destroy" do
    get achievements_destroy_url
    assert_response :success
  end
end
