class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
  @customer = current_customer
  @order = Order.new(order_params)
  @cart_items = current_customer.cart_items
  @total = 0

  if params[:order][:address_selection] == "customer"
    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
  elsif params[:order][:address_selection] == "registered"
    selected_address = Address.find(params[:order][:address_id])
    @order.post_code = selected_address.post_code
    @order.address = selected_address.address
    @order.name = selected_address.name
  elsif params[:order][:address_selection] == "new_address"
    @order.post_code = params[:order][:post_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
  end

  @cart_items.each do |cart_item|
    @item = cart_item.item
    @subtotal = (@item.price * 1.10).round * cart_item.amount
    @total += @subtotal
  end

  @postage = 800
  @total += @postage
  end


  def complete
  end

 def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
  @order.postage = 800
  @total = 0

  @cart_items = current_customer.cart_items
  item_details = []

  @cart_items.each do |cart_item|
    order_detail = OrderDetail.new
    @item = cart_item.item
    order_detail.price_tax = (@item.price * 1.10).floor
    order_detail.quantity = cart_item.quantity
    order_detail.item_id = @item.id
    item_details << order_detail
    @subtotal = order_detail.price_tax * order_detail.quantity
    @total += @subtotal
  end

  @order.billing_amount = @total + @order.postage

  if @order.save
    item_details.each { |order_detail| order_detail.order_id = @order.id; order_detail.save }
    @cart_items.destroy_all
    redirect_to orders_complete_path
  else
    render 'confirm'
  end
 end


  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end

end
