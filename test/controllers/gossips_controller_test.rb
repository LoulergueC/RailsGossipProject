require "test_helper"

class GossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get gossips" do
    get gossips_gossips_url
    assert_response :success
  end
end
