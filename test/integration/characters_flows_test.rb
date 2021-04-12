require 'test_helper'

class CharactersFlowsTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:user_1)
  end

  test "should get list of Characters" do

    get characters_path, params: {character:"Adventures", button:""}
    assert_equal 200, status
    assert_equal characters_path, path
    assert_select 'a'
  end

  test "should show single character" do
    get character_path("1009220")
    assert_equal 200, status
    assert_equal character_path, path
    assert_select 'h1', 'Captain America' # Page title
    assert_select 'img'                   # Image of character
    assert_select 'h3', "Comic books"     # Title for comic books - there might be none

    # Favorite and Unfavor it
    assert_select 'form' do
      assert_select "[id=new_favorite]"
    end

    assert_select 'a' do
      assert_select "[rel=nofollow]"
    end
  end
end
