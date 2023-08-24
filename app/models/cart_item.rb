class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :product
 
  合計金額を求めるメソッド
  def subtotal
    (amount * product.with_tax_price).floor
  end

end
