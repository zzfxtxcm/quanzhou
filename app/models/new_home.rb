class NewHome < ActiveRecord::Base
  belongs_to :area
  belongs_to :developers
  belongs_to :status
  belongs_to :section
  belongs_to :property_type
  belongs_to :construction_category
  belongs_to :area_range
  belongs_to :project_features

  has_many :information
  has_many :information_estate_openeds, dependent: :destroy

  has_many :albums, dependent: :destroy
  accepts_nested_attributes_for :albums, :allow_destroy => true

  has_many :group_buyings, dependent: :destroy
  has_many :intention_to_registers, dependent: :destroy

  has_many :apartments, dependent: :destroy
  accepts_nested_attributes_for :apartments, :allow_destroy => true

  VALID_NUMBER_REGEX = /[\d]/
  validates :name, presence: true
  validates :price, format: { with: VALID_NUMBER_REGEX }
  validates :area, presence:true
  validates :developers, presence:true
  validates :status, presence:true

  mount_uploader :new_home_thumb, NewHomeThumbUploader

  searchable do
    text :name, :boost => 5
    integer :area_id
    integer :section_id
    integer :area_range_id
    integer :property_type_id
    integer :price
    integer :status_id
    text :content
    time :created_at
  end
end
