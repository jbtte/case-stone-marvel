require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:user_1)
  end

  test "should display index page for favorites" do
    get "/favorites"
    assert_select 'h2', 'Comic Books'
    assert_select 'h2', 'Characters'
  end

end
