require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end

  describe '商品購入' do
  context '商品購入ができる場合' do
    it '全ての情報が正しく入力されていれば登録できる' do
      expect(@purchase_address).to be_valid
    end
    it '建物名が空欄でも購入できる' do
      @purchase_address.building = ''
      expect(@purchase_address).to be_valid
    end
  end

  context '商品購入が出来ない場合'do
  it 'Tokenが空欄だと購入出来ない' do
    @purchase_address.token = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Token can't be blank")
  end
  it '郵便番号が空欄だと購入出来ない' do
    @purchase_address.post_code = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Post code can't be blank")
  end
  it '都道府県が空欄だと購入出来ない' do
    @purchase_address.area_id = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Area can't be blank")
  end
  it '市区町村が空欄だと購入出来ない' do
    @purchase_address.municipality = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Municipality can't be blank")
  end
  it '番地が空欄だと購入出来ない' do
    @purchase_address.address = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Address can't be blank")
  end
  it '電話番号が空欄だと購入出来ない' do
    @purchase_address.phone  = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Phone can't be blank")
  end
  it '郵便番号は「3桁ハイフン4桁」での入力でないと購入できない' do
    @purchase_address.post_code = '1500068'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Post code は、「3桁ハイフン4桁」の半角文字列で設定してください")
  end
  it '郵便番号は半角文字列での入力でないと購入できない' do
    @purchase_address.post_code = '１５０−００６８'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Post code は、「3桁ハイフン4桁」の半角文字列で設定してください")
  end
  it '電話番号は10桁以上でないと購入できない' do
    @purchase_address.phone = '10905684' 
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Phone は、10桁以上11桁以内の半角数値で設定してください")
  end
  it '電話番号は11桁以内でないと購入できない' do
    @purchase_address.phone = '190568421735'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Phone は、10桁以上11桁以内の半角数値で設定してください")
  end
  it '電話番号は半角数値での入力でないと購入できない' do
    @purchase_address.phone = '１９０５６８４３２９１'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include ("Phone は、10桁以上11桁以内の半角数値で設定してください")
  end
  it 'ユーザーが紐づいていないと購入できない' do
    @purchase_address.user_id = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("User can't be blank")
  end
  it '商品が紐づいていないと購入できない' do
    @purchase_address.item_id = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
  end
  end
end
end