require 'test_helper'

class TimeStampsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_stamp = time_stamps(:one)
  end

  test "should get index" do
    get time_stamps_url
    assert_response :success
  end

  test "should get new" do
    get new_time_stamp_url
    assert_response :success
  end

  test "should create time_stamp" do
    assert_difference('TimeStamp.count') do
      post time_stamps_url, params: { time_stamp: { amount: @time_stamp.amount, name: @time_stamp.name } }
    end

    assert_redirected_to time_stamp_url(TimeStamp.last)
  end

  test "should show time_stamp" do
    get time_stamp_url(@time_stamp)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_stamp_url(@time_stamp)
    assert_response :success
  end

  test "should update time_stamp" do
    patch time_stamp_url(@time_stamp), params: { time_stamp: { amount: @time_stamp.amount, name: @time_stamp.name } }
    assert_redirected_to time_stamp_url(@time_stamp)
  end

  test "should destroy time_stamp" do
    assert_difference('TimeStamp.count', -1) do
      delete time_stamp_url(@time_stamp)
    end

    assert_redirected_to time_stamps_url
  end
end
