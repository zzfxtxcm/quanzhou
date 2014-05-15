class Album < ActiveRecord::Base
  belongs_to :new_home
  belongs_to :album_class

  mount_uploader :url, AlubmUploader
end
