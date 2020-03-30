require 'test_helper'

class ArtLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @art_log = art_logs(:one)
  end

  test "should get index" do
    get art_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_art_log_url
    assert_response :success
  end

  test "should create art_log" do
    assert_difference('ArtLog.count') do
      post art_logs_url, params: { art_log: {  } }
    end

    assert_redirected_to art_log_url(ArtLog.last)
  end

  test "should show art_log" do
    get art_log_url(@art_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_art_log_url(@art_log)
    assert_response :success
  end

  test "should update art_log" do
    patch art_log_url(@art_log), params: { art_log: {  } }
    assert_redirected_to art_log_url(@art_log)
  end

  test "should destroy art_log" do
    assert_difference('ArtLog.count', -1) do
      delete art_log_url(@art_log)
    end

    assert_redirected_to art_logs_url
  end
end
