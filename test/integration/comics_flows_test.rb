require 'test_helper'

class ComicsFlowsTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:user_1)
  end

  test "should get list of Comic Books" do
    get comics_path, params: {comics:"Adventures", button:""}
    assert_equal 200, status
    assert_equal comics_path, path
    assert_select 'a'
  end

  test "should show single comic book" do
    get comic_path("77228")
    assert_equal 200, status
    assert_equal comic_path, path
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
