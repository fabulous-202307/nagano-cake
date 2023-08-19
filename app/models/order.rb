class Order < ApplicationRecord

  belongs_to :customer
  
  enum status: {
    waiting_payment: 0,
    confirm_payment: 1,
    shipped
  }

  has_many :order_details, dependent: :destroy

  # 郵便番号（ハイフンなし7桁）
  validates :post_code, format: { with: /\A\d{7}\z/ }

  validates :address,
            :name,
  presence: true

end
