class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.integer :project_id
      t.text :title
      t.text :avatars
      t.text :caption

      t.timestamps null: false
    end
  end
end
