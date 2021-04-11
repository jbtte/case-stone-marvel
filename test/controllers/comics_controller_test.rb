require 'test_helper'

class ComicsControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:user_1)
  end

  test "should display images of comic books - index" do
    get "/comics?comic=Adventures&button="
    assert_select 'a'
  end

  test "should display title image and Characters (title)" do
    get "/comics/77228"
    assert_select 'h2', 'Adventures Of Spider-Man: Radioactive (Trade Paperback)' # Page title
    assert_select 'img'                   # Image of comic
    assert_select 'h3', "Characters"     # Title for comic books - there might be none


    # Favorite and Unfavor it
    assert_select 'form' do
      assert_select "[id=new_favorite]"
    end

    assert_select 'a' do
      assert_select "[rel=nofollow]"
    end
  end
end
