class Album < ActiveRecord::Base
  belongs_to :new_home

  mount_uploader :url, AlubmUploader
end
