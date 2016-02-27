json.array!(@onshore_yards) do |onshore_yard|
  json.extract! onshore_yard, :id, :description, :location, :area, :remark
  json.url onshore_yard_url(onshore_yard, format: :json)
end
