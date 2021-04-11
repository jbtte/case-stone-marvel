require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  test "should not save favorite without number" do
    favorite = Favorite.new
    favorite.user_id = 1
    favorite.name = "Hello World"
    favorite.character = true
    assert_not favorite.save, "Saved favorite without number"
  end

  test "should not save favorite without name" do
    favorite = Favorite.new
    favorite.user_id = 1
    favorite.number = 1324
    favorite.character = true
    assert_not favorite.save, "Saved favorite without name of character"
  end

  test "should not save favorite without user_id" do
    favorite = Favorite.new
    favorite.name = "Spider-man"
    favorite.number = 1324
    favorite.character = true
    assert_not favorite.save, "Saved favorite without user_id"
  end

  test "should not save favorite without character definition" do
    favorite = Favorite.new
    favorite.name = "Spider-man"
    favorite.number = 1324
    favorite.user_id = 1
    assert_not favorite.save, "Saved favorite without character definition
    "
  end
end
