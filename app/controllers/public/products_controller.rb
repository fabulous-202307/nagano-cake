class Public::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
    @genres = Genre.all
    @count_products = Product.count

  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :detail, :is_available, :image)
  end

end
