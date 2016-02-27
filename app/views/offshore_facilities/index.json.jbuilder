json.array!(@offshore_facilities) do |offshore_facility|
  json.extract! offshore_facility, :id, :equipment, :descripton
  json.url offshore_facility_url(offshore_facility, format: :json)
end
