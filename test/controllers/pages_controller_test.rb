require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get trend" do
    get pages_trend_url
    assert_response :success
  end

  test "should get search" do
    get pages_search_url
    assert_response :success
  end

  test "should get mypage" do
    get pages_mypage_url
    assert_response :success
  end

end
