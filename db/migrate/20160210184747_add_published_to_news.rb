class AddPublishedToNews < ActiveRecord::Migration
  def change
    add_column :news, :published, :date
  end
end
