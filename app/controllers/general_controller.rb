class GeneralController < ApplicationController
  def index
  end

  def show
    @characters = find_character(params[:id])
  end

  def search
    puts params
    @characters = find_characters(params[:character])
    @characters = @characters["data"]['results']

    unless @characters
      flash[:alert] = 'Character not found'
      return render action: :index
    end
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
end
