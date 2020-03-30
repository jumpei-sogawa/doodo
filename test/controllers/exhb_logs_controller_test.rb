require 'test_helper'

class ExhbLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exhb_log = exhb_logs(:one)
  end

  test "should get index" do
    get exhb_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_exhb_log_url
    assert_response :success
  end

  test "should create exhb_log" do
    assert_difference('ExhbLog.count') do
      post exhb_logs_url, params: { exhb_log: {  } }
    end

    assert_redirected_to exhb_log_url(ExhbLog.last)
  end

  test "should show exhb_log" do
    get exhb_log_url(@exhb_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_exhb_log_url(@exhb_log)
    assert_response :success
  end

  test "should update exhb_log" do
    patch exhb_log_url(@exhb_log), params: { exhb_log: {  } }
    assert_redirected_to exhb_log_url(@exhb_log)
  end

  test "should destroy exhb_log" do
    assert_difference('ExhbLog.count', -1) do
      delete exhb_log_url(@exhb_log)
    end

    assert_redirected_to exhb_logs_url
  end
end
