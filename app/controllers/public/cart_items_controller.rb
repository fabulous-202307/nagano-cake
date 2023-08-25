class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0){|sum,cart_item| sum+cart_item.subtotal}
  end

  def create
    if current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id]).present?
      cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
      sum = cart_item.amount + (params[:cart_item][:amount]).to_i
      cart_item.update(amount: sum)
    else
      cart_item = CartItem.new(params_cart_item)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(params_cart_item)
    flash[:notice]="数量を変更しました"
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:notice]="商品を削除しました"
      redirect_to cart_items_path
    end
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice]="カートを空にしました"
    redirect_to cart_items_path
  end

  def params_cart_item
    params.require(:cart_item).permit(:amount, :product_id, :customer_id)
  end

  def authenticate_customer!
    unless current_customer
      flash[:notice]= "ログインしてください"
      redirect_to request.referer
    end
  end
end
