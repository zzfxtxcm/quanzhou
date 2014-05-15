class AddAlbumClassIdToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :album_class_id, :integer
    add_index :albums, :album_class_id
  end
end
