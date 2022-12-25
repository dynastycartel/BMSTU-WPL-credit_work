require "test_helper"

class DesiredPlanetsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get desired_planets_create_url
    assert_response :success
  end

  test "should get destroy" do
    get desired_planets_destroy_url
    assert_response :success
  end
end
