class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  
  # 注文のステータスを更新するアクション
  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    if @order.update(order_params)
      # ①注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
      @order_items.update_all(making_status: 1) if @order.status == "payment_confirmation"
    end
    redirect_to admin_order_path(@order)
  end

  private
  
   # ストロングパラメーターの定義

  def order_params
    params.require(:order).permit(:status)
  end
end
