class AddStatusAndProjectTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :status, :boolean , :default => false
    add_column :projects, :project_type, :string
  end
end
