class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.delivery_fee = 800
    @total_price = @cart_items.inject(0){|sum,cart_item| sum+cart_item.subtotal}
    @total_sum = @total_price + @order.delivery_fee

    if params[:order][:address_selection] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
    elsif params[:order][:address_selection] == "1"
      selected_address = Address.find(params[:order][:address_id])
      @order.post_code = selected_address.post_code
      @order.address = selected_address.address
      @order.name = selected_address.name
    elsif params[:order][:address_selection] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    # 小計の累積を求めるメソッド
    @total_price = @cart_items.inject(0){|sum,cart_item| sum+cart_item.subtotal}
    # 送料
    @order.delivery_fee = 800
    # 請求額
    @order.billing_fee = @total_price + @order.delivery_fee

    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.product_id = cart_item.product_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = (cart_item.product.price * 1.10).floor
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to complete_orders_path
    else
      redirect_to new_order_path
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :delivery_fee, :billing_fee)
  end
end
