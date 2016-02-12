class ChangedPublished2ToNews < ActiveRecord::Migration
  def change
    change_column :news , :publish_date , :date
  end
end
