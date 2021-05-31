require 'test_helper'

class PlugsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plug = plugs(:one)
  end

  test "should get index" do
    get plugs_url
    assert_response :success
  end

  test "should get new" do
    get new_plug_url
    assert_response :success
  end

  test "should create plug" do
    assert_difference('Plug.count') do
      post plugs_url, params: { plug: { amount: @plug.amount, name: @plug.name } }
    end

    assert_redirected_to plug_url(Plug.last)
  end

  test "should show plug" do
    get plug_url(@plug)
    assert_response :success
  end

  test "should get edit" do
    get edit_plug_url(@plug)
    assert_response :success
  end

  test "should update plug" do
    patch plug_url(@plug), params: { plug: { amount: @plug.amount, name: @plug.name } }
    assert_redirected_to plug_url(@plug)
  end

  test "should destroy plug" do
    assert_difference('Plug.count', -1) do
      delete plug_url(@plug)
    end

    assert_redirected_to plugs_url
  end
end
