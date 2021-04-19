require 'test_helper'

class NonSensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @non_sense = non_senses(:one)
  end

  test "should get index" do
    get non_senses_url
    assert_response :success
  end

  test "should get new" do
    get new_non_sense_url
    assert_response :success
  end

  test "should create non_sense" do
    assert_difference('NonSense.count') do
      post non_senses_url, params: { non_sense: { amount: @non_sense.amount, name: @non_sense.name } }
    end

    assert_redirected_to non_sense_url(NonSense.last)
  end

  test "should show non_sense" do
    get non_sense_url(@non_sense)
    assert_response :success
  end

  test "should get edit" do
    get edit_non_sense_url(@non_sense)
    assert_response :success
  end

  test "should update non_sense" do
    patch non_sense_url(@non_sense), params: { non_sense: { amount: @non_sense.amount, name: @non_sense.name } }
    assert_redirected_to non_sense_url(@non_sense)
  end

  test "should destroy non_sense" do
    assert_difference('NonSense.count', -1) do
      delete non_sense_url(@non_sense)
    end

    assert_redirected_to non_senses_url
  end
end
