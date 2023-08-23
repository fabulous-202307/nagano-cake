class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all.page(params[:page]).per(10).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @full_name = @order.customer.last_name + "" + @order.customer.first_name
  end


  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details

    if @order.status == "入金確認"
      @order_details.each do |order_detail|
        order_detail.production_status = "製作待ち"
        order_detail.save
      end
    end
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
