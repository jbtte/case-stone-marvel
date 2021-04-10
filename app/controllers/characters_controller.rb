class CharactersController < ApplicationController
  include ApiCall

  def home
  end

  def index
    @characters = find_characters(params[:character])["data"]['results']
  end

  def show
    @character = find_character(params[:id])["data"]['results'][0]
    @favorite_new = Favorite.new
    @favorite = Favorite.where(user_id: current_user, number:params[:id])
  end

  private

  def find_characters(usr_input)
    char_hash = {nameStartsWith: usr_input}
    request_api(
      "https://gateway.marvel.com:443/v1/public/characters",
      char_hash
    )
  end

  def find_character(id)
    request_api(
      "https://gateway.marvel.com:443/v1/public/characters/#{id}"
    )
  end

end
