class AddIsAbroadToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_abroad, :boolean , :default => 0
  end
end
