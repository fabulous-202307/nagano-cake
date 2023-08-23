class Public::OrderDetailsController < ApplicationController
  
  def index
    @order_details = OrderDetail.all
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end
  
  private
  
  def order_details_params
    params.require(:order_details).permit(:order_id, :product_id, :price, :amount, :production_status)
  end
  
end
