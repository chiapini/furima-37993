require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録が出来る場合' do
      it '全ての情報が正しく埋められていたら登録出来る' do
        expect(@user).to be_valid
      end
    end

    context '新規登録が出来ない場合' do
      it 'ニックネームが空だったら登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空だったら登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'パスワードが空だったら登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '苗字が空だったら登録できない' do
        @user.first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First can't be blank")
      end

      it '名前が空だったら登録できない' do
        @user.last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last can't be blank")
      end

      it '苗字(カナ)が空だったら登録できない' do
        @user.first2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First2 can't be blank")
      end

      it '名前(カナ)が空だったら登録できない' do
        @user.last2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last2 can't be blank")
      end

      it '誕生日が空だったら登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'メールアドレスが重複していたら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは＠を含まないと登録できない' do
        @user.email = 'emailcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードは６文字以上でないと登録できない' do
        @user.password = '1234'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは128文字以下でないと登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'パスワードは半角英数字混合でないと登録できない' do
        @user.password = 'chiara'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードは半角数値のみでは保存できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードは全角英数字では保存できない' do
        @user.password = 'ｃｈｉａｒａ１２'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードと確認用パスワードが一致していないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '124567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '苗字は全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.first = 'filippini'
        @user.valid?
        expect(@user.errors.full_messages).to include('First 全角文字を使用してください')
      end

      it '名前は全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.last = 'chiara'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last 全角文字を使用してください')
      end

      it '苗字（カナ）は全角（カタカナ）での入力でないと登録できない' do
        @user.first2 = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('First2 全角(カタカナ)を使用してください')
      end

      it '名前（カナ）は全角（カタカナ）での入力でないと登録できない' do
        @user.last2 = '夏菜子'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last2 全角(カタカナ)を使用してください')
      end

      it 'ニックネームは40文字以下でないと登録できない' do
        @user.nickname = 'テスト' * 15
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 40 characters)')
      end
    end
  end
end
