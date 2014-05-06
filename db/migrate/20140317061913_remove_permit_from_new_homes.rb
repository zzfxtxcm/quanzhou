class RemovePermitFromNewHomes < ActiveRecord::Migration
  def change
    remove_column :new_homes, :permit, :string
  end
end
