module ApiCall
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

    return nil if response.status != 200

    JSON.parse(response.body)
  end
end
