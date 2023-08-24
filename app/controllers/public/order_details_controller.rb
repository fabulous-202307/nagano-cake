class Public::OrderDetailsController < ApplicationController
  
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @total = @order_detail.inject(0) { |sum, order_detail| sum + order_detail.subtotal }
  end
  
  private
  
  def order_details_params
    params.require(:order_details).permit(:order_id, :product_id, :price, :amount, :production_status)
  end
  
end