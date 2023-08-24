class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :product
  
    # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    (amount * with_tax_price).floor
  end
  
  def subtotal_no_tax
    (price * amount)
  end
  
end
