class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)

    #もし「製作中」の注文詳細が1つ以上ある場合、注文のステータスを "製作中" に更新する
    if @order_details.where(production_status:"製作中").count >= 1
      @order.status = "製作中"
      @order.save
    end
    
    #もしすべての注文詳細が「製作完了」の場合、注文のステータスを "発送準備中" に更新する
    if @order.order_details.count == @order_details.where(production_status: "製作完了").count
      @order.status = "発送準備中"
      @order.save
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end