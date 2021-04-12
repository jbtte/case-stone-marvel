require 'test_helper'

class FavoritesFlowsTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:user_1)
  end

  test "should display index page for favorites" do
    get favorites_path
    assert_select 'h2', 'Comic Books'
    assert_select 'h2', 'Characters'
  end

  test "should favorite and unfavorite a comic" do
    # First go to comic book page
    get comic_path("77228")
    assert_equal 200, status

    # Check if favorite links divs were loaded
    assert_select 'div' do
      assert_select "[class=not-favorited]"
      assert_select "[class=favorited]"
    end

    # Favorite the comic book
    post favorites_path, params: {"name"=>"Adventures Of Spider-Man: Radioactive (Trade Paperback)",
                                  "number"=>"77228",
                                  "url"=>"http://i.annihil.us/u/prod/marvel/i/mg/f/30/5dcedb460d5b6",
                                  "character"=>"false",
                                  "button"=>""}
    assert_equal 204, status
    assert_equal favorites_path, path

    # Go to favorite page and check if book was favorited
    get favorites_path
    assert_equal 200, status
    assert_select "p", "Adventures Of Spider-Man: Radioactive (Trade Paperback)"
  end

  test "should favorite and unfavorite a character" do
    # First go to character's page
    get character_path("1009220")
    assert_equal 200, status

    # Check if favorite links divs were loaded
    assert_select 'div' do
      assert_select "[class=not-favorited]"
      assert_select "[class=favorited]"
    end

    # Favorite the character
    post favorites_path, params: {"name"=>"Captain America",
                                  "number"=>"1009220",
                                  "url"=>"http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087",
                                  "character"=>"true",
                                  "button"=>""}
    assert_equal 204, status
    assert_equal favorites_path, path

    # Go to favorite page and check if character was favorited
    get favorites_path
    assert_equal 200, status
    assert_select "p", "Captain America"
  end


end
