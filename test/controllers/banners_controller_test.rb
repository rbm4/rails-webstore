require 'test_helper'

class BannersControllerTest < ActionDispatch::IntegrationTest
  test "should get image" do
    get banners_image_url
    assert_response :success
  end

  test "should get link" do
    get banners_link_url
    assert_response :success
  end

  test "should get photo_url" do
    get banners_photo_url_url
    assert_response :success
  end

end
