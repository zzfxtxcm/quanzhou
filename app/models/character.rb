class Character < ActiveRecord::Base
  mount_uploader :character_thumb, CharacterThumbUploader
end
