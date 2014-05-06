class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :url
      t.string :name
      t.integer :new_home_id

      t.timestamps
    end

    add_index :albums, :new_home_id
  end
end
