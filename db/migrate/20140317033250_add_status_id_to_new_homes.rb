class AddStatusIdToNewHomes < ActiveRecord::Migration
  def change
    add_column :new_homes, :status_id, :integer
    add_index :new_homes, :status_id
  end
end
