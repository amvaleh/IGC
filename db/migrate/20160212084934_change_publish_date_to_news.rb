class ChangePublishDateToNews < ActiveRecord::Migration
  def change
    remove_column :news , :publish_date
    add_column :news , :publish_date , :date, null: false , default: 0
  end
end
