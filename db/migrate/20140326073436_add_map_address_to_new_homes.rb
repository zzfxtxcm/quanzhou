class AddMapAddressToNewHomes < ActiveRecord::Migration
  def change
    add_column :new_homes, :map_address, :string
  end
end
