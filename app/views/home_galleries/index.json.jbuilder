json.array!(@home_galleries) do |home_gallery|
  json.extract! home_gallery, :id, :avatars
  json.url home_gallery_url(home_gallery, format: :json)
end
