class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates  :nickname, :first, :last, :first2, :last2, :birthday, presence: true
  validates  :nickname, length: { maximum: 40 }

  validates  :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' }

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first, :last
  end
  with_options format: { with: /\A[ァ-ヶー]+\z/, message: '全角(カタカナ)を使用してください' } do
    validates :first2, :last2
  end

  has_many :items
  has_many :purchases
end
