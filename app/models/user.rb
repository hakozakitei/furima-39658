class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネームの存在確認
  validates :nickname, presence: true

  # パスワードの半角英数字混合確認
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birth_date, presence: true

  has_many :items
  has_many :purchases

end