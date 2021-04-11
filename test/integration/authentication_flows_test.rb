require 'test_helper'

class AuthenticationFlowsTest < ActionDispatch::IntegrationTest
  fixtures :users

  test 'should open login page and login' do
    # get the login page
    get "/"
    assert_redirected_to new_user_session_url


    # post the login and follow through to the home page
    post user_session_path, params: { user: {email: users(:user_1).email,
                                      password: "123456"} }
    follow_redirect!
    assert_equal 200, status
    assert_equal root_path, path
  end


  test 'should sign up' do
    # get the login page
    get new_user_registration_path
    assert_equal 200, status

    # post the info and follow through to the home page
    post user_session_path, params: { user: {first_name: "Mark",
                                             last_name: "Evans",
                                             email: "mark.evans@tampabay.com",
                                             password: "123456",
                                             password_confirmation: "123456"} }


    assert_equal 200, status
    assert_equal new_user_session_path, path
  end

  test 'should logout' do
    sign_in users(:user_1)
    delete destroy_user_session_path


    assert_equal 302, status
    follow_redirect!
    assert_equal '/unauthenticated', path
  end

  test 'edit profile' do
    sign_in users(:user_1)
    get edit_user_registration_path
    assert_equal 200, status

    put user_registration_path params: { user: {first_name: "Mark",
                                             last_name: "Evans",
                                             email: "mark.evans@tampabay.com",
                                             password: "123456",
                                             password_confirmation: "123456",
                                             current_password: "123456"} }

    assert_equal 302, status
    follow_redirect!
    assert_equal root_path, path
  end

end
