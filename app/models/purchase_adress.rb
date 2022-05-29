class PurchaseAdress 
  include ActiveModel::Model
  attr_accessor :post_code,:area_id,:building,:municipality,:adress,:phone,   :purchase,:user, :item

  validates :post_code, format: { with: /\A\d{3}{-}\d{4}\z/, message: '「3桁-4桁」の半角文字列で設定してください'}
  validates :phone, numericality: {with: /\A[0-9]{10,11}\z/, message: '電話番号は、10桁以上11桁以内の半角数値で設定してください'}
  validates  :post_code,:area_id,:municipality,:adress,:phone,:purchase, :user, :item,  presence: true

  def save
    Purchase.create()
    Adress.create(post_code: post_code,area_id: area_id,building: building,municipality: municipality,adress: adress,phone: phone)
  end
end
 