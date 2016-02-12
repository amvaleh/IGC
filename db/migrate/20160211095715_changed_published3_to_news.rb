class ChangedPublished3ToNews < ActiveRecord::Migration
  def change
    change_column :news , :publish_date , :datetime
  end
end
