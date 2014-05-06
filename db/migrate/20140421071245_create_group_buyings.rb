class CreateGroupBuyings < ActiveRecord::Migration
  def change
    create_table :group_buyings do |t|
      t.integer :new_home_id
      t.integer :price
      t.text :explanation
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
