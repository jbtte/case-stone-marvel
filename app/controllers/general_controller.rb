class GeneralController < ApplicationController
  def index
  end

  def search
    caracter = find_caracter(params[:caracter])
    unless caracter
      flash[:alert] = 'Caracter not found'
      return render action: :index
    end
  end

  private

  def request_api(url)
    response = Excon.get(
      url,
      Params: {
        "apikey": "your api key",
        "ts": "a timestamp",
        "hash": "your hash"
      }
    )
    return nil if response.status != 200
    JSON.parse(response.body)
  end
  def find_caracter(caracter)
    request_api(
      "https://restcountries-v1.p.rapidapi.com/name/#{URI.encode(name)}"
    )
  end
end
