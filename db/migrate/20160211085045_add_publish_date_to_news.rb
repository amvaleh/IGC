class AddPublishDateToNews < ActiveRecord::Migration
  def change
    change_column :news , :published , :boolean , :default => true
    add_column :news, :publish_date, :date
  end
end
