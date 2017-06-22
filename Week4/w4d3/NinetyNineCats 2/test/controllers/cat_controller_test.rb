require 'test_helper'

class CatControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cat_create_url
    assert_response :success
  end

end
