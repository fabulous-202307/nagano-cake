class Public::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(8)
    @genres = Genre.all
    @count_products = Product.count

  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :detail, :is_available, :image)
  end

end
