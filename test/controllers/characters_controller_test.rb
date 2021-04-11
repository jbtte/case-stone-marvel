require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest

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

  test "should display images of characters - index" do
    get "/characters?character=Captain+America&button="
    assert_select 'a'
  end

  test "should display title image and comic books (title)" do
    get "/characters/1009220"
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
