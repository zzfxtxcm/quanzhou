class AddPropertyTypeIdToNewHomes < ActiveRecord::Migration
  def change
    add_column :new_homes, :property_type_id, :integer
    add_index :new_homes, :property_type_id
  end
end
