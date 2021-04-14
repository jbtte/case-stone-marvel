require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome

  def setup
    sign_in users(:user_1)
  end

  test "searching for a character" do
    visit root_path

    fill_in "Search by Character", with: "Captain America"
    click_on("Search", match: :first)

    assert_text "Captain America"

    click_on "Captain America"
    assert_text "Captain America"

    assert_selector(:css, '.not-favorited')
    assert_selector(:css, '.favorited', visible: :hidden)

    find(:css, '.far.fa-heart.fa-2x.heart-red').click

    assert_selector(:css, '.not-favorited', visible: :hidden)
    assert_selector(:css, '.favorited')

    click_on "Favorites"

    click_on "Captain America"

    assert_selector(:css, '.not-favorited', visible: :hidden)
    assert_selector(:css, '.favorited')

    accept_alert {find(:css, '.fas.fa-heart.fa-2x.heart-red').click}

    assert_selector(:css, '.not-favorited')
    assert_selector(:css, '.favorited', visible: :hidden)

    click_on "Favorites"

    assert has_no_text?("Captain America")

  end

end
