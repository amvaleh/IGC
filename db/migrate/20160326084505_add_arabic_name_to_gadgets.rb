class AddArabicNameToGadgets < ActiveRecord::Migration
  def change
    add_column :gadgets, :arabic_name, :string
  end
end
