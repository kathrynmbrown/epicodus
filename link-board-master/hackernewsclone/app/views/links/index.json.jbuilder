json.array!(@links) do |link|
  json.extract! link, :id, :title, :url, :post_date, :user_id
  json.url link_url(link, format: :json)
end
