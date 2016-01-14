json.array!(@news) do |news|
  json.extract! news, :id, :project_id, :title, :avatars, :caption
  json.url news_url(news, format: :json)
end
