# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ConstructionEquipmentCategory.delete_all
ConstructionEquipmentCategory.create!(id: 1, name:"Crawler Crane")
ConstructionEquipmentCategory.create!(id: 2, name:"Other Crane")
ConstructionEquipmentCategory.create!(id: 3, name:"Truck")
ConstructionEquipmentCategory.create!(id: 4, name:"Air Compressor")
ConstructionEquipmentCategory.create!(id: 5, name:"Transportation")
ConstructionEquipmentCategory.create!(id: 6, name:"Civil & Road Machinary")
ConstructionEquipmentCategory.create!(id: 7, name:"Tools")
