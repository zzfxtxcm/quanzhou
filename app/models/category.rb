class Category < ActiveRecord::Base
  has_many :information, dependent: :destroy
  validates :name, presence: true

  has_ancestry
end
