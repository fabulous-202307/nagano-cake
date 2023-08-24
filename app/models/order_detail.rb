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

  #製作状況のステータス
  enum production_status:{"着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3}

end
