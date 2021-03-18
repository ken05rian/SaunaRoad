require 'test_helper'

class PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_images_new_url
    assert_response :success
  end

  test "should get create" do
    get post_images_create_url
    assert_response :success
  end

  test "should get index" do
    get post_images_index_url
    assert_response :success
  end

  test "should get destroy" do
    get post_images_destroy_url
    assert_response :success
  end

end
