class Public::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(8)
    @count_products = Product.count
    @genre = Genre.find_by(params[:genre_id])
    @genres = Genre.all

  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def genre_products
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :detail, :is_available, :image)
  end

end
