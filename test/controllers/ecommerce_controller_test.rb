require "test_helper"

class EcommerceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ecommerce_index_url
    assert_response :success
  end
end
