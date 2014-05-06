class AddAreaRangeIdToNewHomes < ActiveRecord::Migration
  def change
    add_column :new_homes, :area_range_id, :integer
    add_index :new_homes, :area_range_id
  end
end
