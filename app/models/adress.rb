class Adress < ApplicationRecord
  validates :user, :item, presence: true
  validates :post, format: { with: /\A\d{3}{-}\d{4}\z/, message: '「3桁-4桁」の半角文字列で設定してください'}
  validates :phone, numericality: {with: /\A[0-9]{10,11}\z/, message: '電話番号は、10桁以上11桁以内の半角数値で設定してください'}

  belongs_to :purchase
end
