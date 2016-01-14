class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :title
      t.string :client_name
      t.date :start_date
      t.string :contract_type
      t.string :location
      t.integer :duration
      t.text :design_capacity
      t.string :construction_man_hour
      t.text :avatars

      t.timestamps null: false
    end
  end
end
