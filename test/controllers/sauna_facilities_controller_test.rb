require 'test_helper'

class SaunaFacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sauna_facilities_index_url
    assert_response :success
  end

  test "should get show" do
    get sauna_facilities_show_url
    assert_response :success
  end

end
