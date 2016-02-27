class CreateConstructionEquipmentCategories < ActiveRecord::Migration
  def change
    create_table :construction_equipment_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
