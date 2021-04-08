class GeneralController < ApplicationController
  def index
  end

  def show
    @character = find_character(params[:id])["data"]['results'][0]
  end

  def search
    @characters = find_characters(params[:character])["data"]['results']

    unless @characters
      flash[:alert] = 'Character not found'
      return render action: :index
    end
  end

  #### COMIC RELATED #######
  def search_comic
    @comics = find_comics(params[:comic])["data"]['results']

    unless @comics
      flash[:alert] = 'Comic Book not found'
      return render action: :index
    end

  end

  def comic
    @comic = find_comic(params[:id])["data"]['results'][0]
  end





  private

  def request_api(url, dict={})
    # API Login info
    query = {
      ts: Rails.application.credentials.marvel[:TS],
      apikey: Rails.application.credentials.marvel[:API_KEY],
      hash: Rails.application.credentials.marvel[:HASH],
    }

    # Specific information of the query is added
    query.merge!(dict)

    response = Excon.get(
      url,
      query: query
    )

    puts JSON.parse(response.body)

    return nil if response.status != 200

    JSON.parse(response.body)
  end


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

  def find_comics(comic)
    comic_hash = {titleStartsWith: comic}
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
