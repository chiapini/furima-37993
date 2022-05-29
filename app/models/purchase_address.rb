class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :building, :municipality, :address, :phone, :purchase_id, :user_id, :item_id, :token

  validates :post_code, format: { with: /\A\d{3}{-}\d{4}\z/, message: '「3桁-4桁」の半角文字列で設定してください' }
  validates :phone, numericality: { with: /\A[0-9]{10,11}\z/, message: '電話番号は、10桁以上11桁以内の半角数値で設定してください' }
  validates :post_code, :area_id, :municipality, :address, :phone, :purchase_id, :user_id, :item_id, presence: true

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Adress.create(post_code: post_code, area_id: area_id, building: building, municipality: municipality, address: address,
                  phone: phone, purchase_id: purchase_id)
  end
end
