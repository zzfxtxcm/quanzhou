class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :apartment_name
      t.integer :area
      t.string :apartment_thumb
      t.integer :new_home_id

      t.timestamps
    end
  end
end
