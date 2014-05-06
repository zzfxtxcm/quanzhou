class AddNewHomeIdToInformation < ActiveRecord::Migration
  def change
    add_column :information, :new_home_id, :integer
  end
end
