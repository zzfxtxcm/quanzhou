class AddBestToNewHomes < ActiveRecord::Migration
  def change
    add_column :new_homes, :best, :integer
  end
end
