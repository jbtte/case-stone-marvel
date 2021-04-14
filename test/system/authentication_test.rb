require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome
  include ActionController::Helpers
  include ActionController::Flash


  test "logging in" do
    visit root_path

    assert_text "Log in"

    fill_in "Email", with: "tom.brady@toomanylombardis.com"
    fill_in "Password", with: '123456'

    click_on "Log in"

    assert_selector ".alert", text: 'Signed in successfully.'


  end

  test "signing up" do
    visit root_path

    assert_text "Log in"

    click_on "Sign up"

    fill_in "First name", with: "Jerry"
    fill_in "Last name", with: "Rice"
    fill_in "Email", with: "jerry.rice@49ers.com"
    fill_in "user_password", with: '123456'
    fill_in "user_password_confirmation", with: "123456"

    click_on "Sign up"

    assert_selector ".alert", text: 'Welcome! You have signed up successfully.'


  end

end
