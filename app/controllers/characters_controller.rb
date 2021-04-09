class CharactersController < ApplicationController
  include ApiCall

  def home
  end

  def index
    @characters = find_characters(params[:character])["data"]['results']

    unless @characters
      flash[:alert] = 'Character not found'
      return render action: :index
    end
  end

  def show
    @character = find_character(params[:id])["data"]['results'][0]
    @favorite = Favorite.new
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
