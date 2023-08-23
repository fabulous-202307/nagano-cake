class Product < ApplicationRecord

  has_one_attached :image

  belongs_to :genre

  has_many :cart_items
  has_many :order_details

  validates :name, presence: true, uniqueness: true

  validates :price,
            :detail,
  presence: true

end
