class CreateOffshoreFacilities < ActiveRecord::Migration
  def change
    create_table :offshore_facilities do |t|
      t.string :equipment
      t.text :descripton

      t.timestamps null: false
    end
  end
end
