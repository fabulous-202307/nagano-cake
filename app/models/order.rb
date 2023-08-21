class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_details, dependent: :destroy

  # 郵便番号（ハイフンなし7桁）
  validates :post_code, format: { with: /\A\d{7}\z/ }

  validates :address,
            :name,
  presence: true
  
  # 支払い方法のステータス
  enum payment_method: { credit_card: 0, transfer: 1 }

end
