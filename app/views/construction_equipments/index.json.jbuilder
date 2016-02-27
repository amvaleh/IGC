json.array!(@construction_equipments) do |construction_equipment|
  json.extract! construction_equipment, :id, :ConstructionEquipmentCategory_id, :production_date, :quantity, :Description
  json.url construction_equipment_url(construction_equipment, format: :json)
end
