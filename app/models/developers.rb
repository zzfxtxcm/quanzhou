class Developers < ActiveRecord::Base
  has_many :new_homes, dependent: :destroy
end
