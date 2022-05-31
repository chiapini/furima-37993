class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :building, :municipality, :address, :phone, :purchase_id, :user_id, :item_id, :token

  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は、「3桁ハイフン4桁」の半角文字列で設定してください' }
  validates :phone, format: { with: /\A\d{10,11}\z/, message: 'は、10桁以上11桁以内の半角数値で設定してください' }
  validates :post_code,:municipality, :address, :phone, :user_id, :item_id,:token, presence: true
  validates :area_id,numericality: { other_than: 1, message: "can't be blank" }


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, building: building, municipality: municipality, address: address,
                  phone: phone, purchase_id: purchase.id)
  end
end
