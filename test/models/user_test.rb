require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user_1 = users(:user_1)
    @user_2 = users(:user_2)
  end

  test "Add User with correct info" do
    @user = User.new
    @user.first_name = "Brad"
    @user.last_name = "Pitt"
    @user.email = "brad.pitt@hollywood.com"
    @user.password = '123456'
    assert @user.save!, "Didn't save user with the correct information"
  end

  test "Add User without email" do
    @user = User.new
    @user.first_name = "Brad"
    @user.last_name = "Pitt"
    @user.password = '123456'
    assert_not @user.save, "Saved user without email"
  end

  test "Add User without password" do
    @user = User.new
    @user.first_name = "Brad"
    @user.last_name = "Pitt"
    @user.email = "brad.pitt@hollywood.com"
    assert_not @user.save, "Saved user without password"
  end

  test "Deleting User" do
    @user = User.find(@user_1["id"])
    assert @user.destroy, "User not deleted"
  end


end
