class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_details, dependent: :destroy

  # 郵便番号（ハイフンなし7桁）
  validates :post_code, format: { with: /\A\d{7}\z/ }

  validates :address,
            :name,
  presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
	enum status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

end
