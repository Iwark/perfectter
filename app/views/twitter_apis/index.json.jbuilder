json.array!(@twitter_apis) do |twitter_api|
  json.extract! twitter_api, :id, :api_key, :api_secret, :access_token, :access_token_secret
  json.url twitter_api_url(twitter_api, format: :json)
end
