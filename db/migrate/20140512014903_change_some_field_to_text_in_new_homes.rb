class ChangeSomeFieldToTextInNewHomes < ActiveRecord::Migration
  def change
    change_column :new_homes, :shopping, :text
    change_column :new_homes, :neighborhoods, :text
    change_column :new_homes, :landscapes, :text
    change_column :new_homes, :bus, :text
    change_column :new_homes, :car, :text
    change_column :new_homes, :fit, :text
    change_column :new_homes, :property, :text
    change_column :new_homes, :school, :text
    change_column :new_homes, :hospital, :text
    change_column :new_homes, :bank, :text
  end
end
