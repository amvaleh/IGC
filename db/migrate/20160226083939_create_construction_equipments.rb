class CreateConstructionEquipments < ActiveRecord::Migration
  def change
    create_table :construction_equipments do |t|
      t.integer :construction_equipment_category_id
      t.string :production_date
      t.integer :quantity
      t.string :Description

      t.timestamps null: false
    end
  end
end
