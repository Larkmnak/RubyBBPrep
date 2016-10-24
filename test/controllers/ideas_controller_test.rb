require 'test_helper'

class IdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get ideas_home_url
    assert_response :success
  end

end
