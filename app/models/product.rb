class Product < ApplicationRecord

  has_one_attached :image

  belongs_to :genre

  has_many :cart_items
  has_many :order_details

  validates :name, presence: true, uniqueness: true

  validates :price,
            :detail,
  presence: true

  # 画像呼び出しメソッド
　def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end

end

