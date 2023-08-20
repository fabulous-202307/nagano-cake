class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders

  validates :last_name,
            :first_name,
            :last_name_kana,
            :first_name_kana,
            :address,
  presence: true

  # 電話番号(ハイフンなし10桁or11桁)
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  # 郵便番号（ハイフンなし7桁）
  validates :post_code, format: { with: /\A\d{7}\z/ }


end
