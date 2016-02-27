json.array!(@construction_equipment_categories) do |construction_equipment_category|
  json.extract! construction_equipment_category, :id, :name
  json.url construction_equipment_category_url(construction_equipment_category, format: :json)
end
