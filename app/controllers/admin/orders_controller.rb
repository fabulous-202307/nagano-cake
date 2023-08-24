class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!

 def index
  @orders = Order.page(params[:page])
 end

 def show
  @order = Order.find(params[:id])
  @order_details = OrderDetail.where(order_id: @order.id)
  @full_name = @order.customer.last_name + "" + @order.customer.first_name
 end

 def update
   @order_user = Costomer.find(params[:id])
   @order = Order.find(params[:id])
   @order.update(order_params)
   @order_details = @order.order_details

   #もし注文のステータスが「入金確認」の場合、以下の処理を行う
   if @order.status == "入金確認"
     @order_details.each do |order_detail|
     order_detail.production_status = "製作待ち"
     order_detail.save
     end
   end
  redirect_to admin_order_path(@order_user)
 end

 private

 def order_params
  params.require(:order).permit(:status)
 end

end

