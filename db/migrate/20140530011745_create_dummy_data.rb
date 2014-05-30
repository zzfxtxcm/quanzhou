class CreateDummyData < ActiveRecord::Migration
  def change
    create_table :dummy_data do |t|
      t.integer :new_home_id
      t.integer :total_hit
      t.integer :today_hit
      t.integer :yest_hit
      t.integer :read
      t.integer :want

      t.timestamps
    end
  end
end
