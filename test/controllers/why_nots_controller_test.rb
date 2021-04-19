require 'test_helper'

class WhyNotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @why_not = why_nots(:one)
  end

  test "should get index" do
    get why_nots_url
    assert_response :success
  end

  test "should get new" do
    get new_why_not_url
    assert_response :success
  end

  test "should create why_not" do
    assert_difference('WhyNot.count') do
      post why_nots_url, params: { why_not: { amount: @why_not.amount, name: @why_not.name } }
    end

    assert_redirected_to why_not_url(WhyNot.last)
  end

  test "should show why_not" do
    get why_not_url(@why_not)
    assert_response :success
  end

  test "should get edit" do
    get edit_why_not_url(@why_not)
    assert_response :success
  end

  test "should update why_not" do
    patch why_not_url(@why_not), params: { why_not: { amount: @why_not.amount, name: @why_not.name } }
    assert_redirected_to why_not_url(@why_not)
  end

  test "should destroy why_not" do
    assert_difference('WhyNot.count', -1) do
      delete why_not_url(@why_not)
    end

    assert_redirected_to why_nots_url
  end
end
