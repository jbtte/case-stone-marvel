require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  def setup
    @user = users(:user_1)
    @char_favorite = favorites(:character_favorite)
    @comic_favorite = favorites(:comic_favorite)

  end

  test "should not save favorite without number" do
    favorite = Favorite.new
    favorite.user_id = @user["id"]
    favorite.name = "Hello World"
    favorite.character = true
    assert_not favorite.save, "Saved favorite without number"
  end

  test "should not save favorite without name" do
    favorite = Favorite.new
    favorite.user_id = @user["id"]
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
    favorite.number = 1324
    favorite.user_id = @user["id"]
    assert_not favorite.save, "Saved favorite without character definition"
  end

  test "should save favorite with all information" do
    favorite = Favorite.new
    favorite.name = "Spider-man"
    favorite.number = 1324
    favorite.user_id = @user["id"]
    favorite.character = false
    assert favorite.save!, "Didn't save favorite with the correct information"
  end

  test "delete character favorite" do
    @fav = Favorite.find(@char_favorite["id"])
    assert @fav.destroy, "Didn't delete character favorite entry"
  end

  test "delete comic favorite" do
    @fav = Favorite.find(@comic_favorite["id"])
    assert @fav.destroy, "Didn't delete comic favorite entry"
  end



end
