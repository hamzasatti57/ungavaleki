require 'test_helper'

class LoanReturnControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loan_return_index_url
    assert_response :success
  end

end
