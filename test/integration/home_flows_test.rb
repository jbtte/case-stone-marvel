require 'test_helper'

class HomeFlowsTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:user_1)
  end

  test "should get home" do
    get "/"
    assert_response :success
    assert_select 'form input' do
      assert_select "[name=character]"
      assert_select "[name=comic]"
    end
  end
end
