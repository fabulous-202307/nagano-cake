class Address < ApplicationRecord

  belongs_to :customer

  validates :name,
            :address,
  presence: true

  # 郵便番号（ハイフンなし7桁）
  validates :post_code, format: { with: /\A\d{7}\z/ }

end
