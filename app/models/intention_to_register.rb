class IntentionToRegister < ActiveRecord::Base
  belongs_to :new_home

  VALID_QQ_REGEX = /\A[1-9][0-9]{4,}\z/
  validates :name, presence:true
  validates :tel, presence:true, uniqueness:true
  validates :qq, uniqueness:true, format: { with: VALID_QQ_REGEX }
  validates :new_home_id, presence:true
end
