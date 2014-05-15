class CreateAlbumClasses < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default
    if direction == :up
      AlbumClass.create!(name: '效果图')
      AlbumClass.create!(name: '户型鉴赏')
      AlbumClass.create!(name: '园林景观')
      AlbumClass.create!(name: '样板房')
      AlbumClass.create!(name: '建设进度')
      AlbumClass.create!(name: '配套图片')
      AlbumClass.create!(name: '广告图')
      AlbumClass.create!(name: '活动图片')
    end
  end

  def change
    create_table :album_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
