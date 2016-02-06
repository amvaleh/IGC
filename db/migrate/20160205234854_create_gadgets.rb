class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :name
      t.text :avatars
      t.text :caption

      t.timestamps null: false
    end
  end
end
