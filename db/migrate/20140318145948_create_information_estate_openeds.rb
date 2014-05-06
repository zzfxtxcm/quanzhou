class CreateInformationEstateOpeneds < ActiveRecord::Migration
  def change
    create_table :information_estate_openeds do |t|
      t.string :title
      t.integer :new_home_id
      t.datetime :opening_time
      t.datetime :delivery_time
      t.integer :price

      t.timestamps
    end

    add_index :information_estate_openeds, :new_home_id
  end
end
