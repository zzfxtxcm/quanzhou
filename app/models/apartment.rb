class Apartment < ActiveRecord::Base
  belongs_to :new_home

  mount_uploader :apartment_thumb, ApartmentUploader
end
