class AddSectionIdToNewHomes < ActiveRecord::Migration
  def change
    add_column :new_homes, :section_id, :integer
    add_index :new_homes, :section_id
  end
end
