class Purchase < ApplicationRecord
  validates  :post_code,:area_id,:municipality,:adress,:phone,:purchase, presence: true


  belongs_to :user
  belongs_to :item
  has_one :address
end
