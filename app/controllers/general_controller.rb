class GeneralController < ApplicationController
  def index
  end

  def search
    puts params
    @character = find_character(params[:character])

    unless @character
      flash[:alert] = 'Character not found'
      return render action: :index
    end
  end

  private

  def request_api(url, dict)
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
  def find_character(character)
    char_hash = {name: character}
    request_api(
      "https://gateway.marvel.com:443/v1/public/characters",
      {name: character}
    )
  end
end
