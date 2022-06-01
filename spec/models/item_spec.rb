require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it '全ての情報が正しく埋められていたら出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '商品画像が空だったら出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品画像を入力してください')
      end

      it '商品名が空だったら出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品の説明が空だったら出品できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'カテゴリーが空だったら出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end

      it '商品の状態が空だったら出品できない' do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end

      it '配送料の負担が空だったら出品できない' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end

      it '発送元の地域が空だったら出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end

      it '発送までの日数が空だったら出品できない' do
        @item.jour_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end

      it '価格が空だったら出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end

      it '商品名が40文字以上だったら出品できない' do
        @item.name = 'テスト' * 15
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名は40文字以内で入力してください')
      end

      it '商品説明が1000文字以上だったら出品できない' do
        @item.information = 'テスト' * 400
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
      end

      it '価格が半角数値で入力されていなかったら出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数値で設定してください')
      end

      it '価格が300円以上でないと出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円から9,999,999円の間で設定してください')
      end

      it '価格が9999999円以下でないと出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円から9,999,999円の間で設定してください')
      end

      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
