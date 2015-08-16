json.array!(@accounts) do |account|
  json.extract! account, :id, :tid, :name, :screen_name, :description, :description_url, :is_protected, :followers_count, :friends_count, :favourites_count, :statuses_count, :status, :profile_background_image_url, :profile_image_url, :profile_use_background_image
  json.url account_url(account, format: :json)
end
