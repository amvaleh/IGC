class CreateOnshoreYards < ActiveRecord::Migration
  def change
    create_table :onshore_yards do |t|
      t.string :description
      t.string :location
      t.string :area
      t.string :remark

      t.timestamps null: false
    end
  end
end
