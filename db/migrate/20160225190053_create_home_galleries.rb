class CreateHomeGalleries < ActiveRecord::Migration
  def change
    create_table :home_galleries do |t|
      t.text :avatars

      t.timestamps null: false
    end
  end
end
