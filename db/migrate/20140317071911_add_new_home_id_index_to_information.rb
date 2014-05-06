class AddNewHomeIdIndexToInformation < ActiveRecord::Migration
  def change
    add_index :information, :new_home_id
  end
end
