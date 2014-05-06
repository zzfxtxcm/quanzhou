class AddNewHomeThumbToNewHomes < ActiveRecord::Migration
  def change
    add_column :new_homes, :new_home_thumb, :string
  end
end
