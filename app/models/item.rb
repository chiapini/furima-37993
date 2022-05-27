class Item < ApplicationRecord
  validates  :image, :name, :information, :price, :user, presence: true
  validates  :name, length: { maximum: 40 }
  validates  :information, length: { maximum: 1000 }

  belongs_to :user
  has_one_attached :image

  class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category, :situation, :delivery, :area, :jour
  end

  validates :category_id, :situation_id, :delivery_id, :area_id, :jour_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角数値で設定してください' }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は300円から9,999,999円の間で設定してください' }
end
