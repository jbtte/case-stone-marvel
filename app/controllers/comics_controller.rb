class ComicsController < ApplicationController
  include ApiCall

  def index
    @comics = find_comics(params[:comic])["data"]['results']
  end

  def show
    @comic = find_comic(params[:id])["data"]['results'][0]
    @favorite_new = Favorite.new
    @favorite = Favorite.where(user_id: current_user, number: params[:id])
  end

  private

  def find_comics(comic)
    comic_hash = { titleStartsWith: comic }
    request_api(
      "https://gateway.marvel.com:443/v1/public/comics",
      comic_hash
    )
  end

  def find_comic(id)
    request_api(
      "https://gateway.marvel.com:443/v1/public/comics/#{id}"
    )
  end
end
