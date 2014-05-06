class ChangeConstructionCategoryToNewHomes < ActiveRecord::Migration
  def change
    remove_column :new_homes, :construction_category
    add_column :new_homes, :construction_category_id, :integer
    add_index :new_homes, :construction_category_id
  end
end
