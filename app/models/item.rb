class Item < ApplicationRecord
  validates  :name, :information, :category_id, :situation_id, :delivery_id, :area_id, :jour_id, :price, :user, presence: true

  belongs_to :user
end
