require "application_system_test_case"

class ComicsTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome

  def setup
    sign_in users(:user_1)
  end

  test "searching for a comic and favoriting it" do
    visit root_path

    fill_in "Search by Comic Book title", with: "Adventures Of The X-Men: Tooth & Claw"

    click_on(class: 'btn-danger')

    assert_text "Adventures Of The X-Men: Tooth & Claw (Trade Paperback)"

    click_on "Adventures Of The X-Men: Tooth & Claw (Trade Paperback)"
    assert_text "Adventures Of The X-Men: Tooth & Claw (Trade Paperback)"

    sleep 2

    assert_selector(:css, '.favorited', visible: :hidden)
    assert_selector(:css, '.not-favorited')

    find(:css, '.far.fa-heart.fa-2x.heart-red').click

    assert_selector(:css, '.not-favorited', visible: :hidden)
    assert_selector(:css, '.favorited')

    click_on "Favorites"

    assert_text "Adventures Of The X-Men: Tooth & Claw (Trade Paperback)"
    click_on "Adventures Of The X-Men: Tooth & Claw (Trade Paperback)"

    assert_selector(:css, '.not-favorited', visible: :hidden)
    assert_selector(:css, '.favorited')

    accept_alert {find(:css, '.fas.fa-heart.fa-2x.heart-red').click}

    assert_selector(:css, '.not-favorited')
    assert_selector(:css, '.favorited', visible: :hidden)

    click_on "Favorites"

    assert has_no_text?("Adventures Of The X-Men: Tooth & Claw (Trade Paperback)")

  end

end
