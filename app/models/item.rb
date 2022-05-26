class Item < ApplicationRecord
  validates  :name, :information, :category_id, :situation_id, :delivery_id, :area_id, :jour_id, :price, :user, presence: true

  belongs_to :user

  class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category, :situation, :delivery, :area, :jour
  end

  validates :category_id,:situation_id,:delivery_id,:area_id,:jour_id, numericality: { other_than: 1 ,message: "can't be blank"} 

end
