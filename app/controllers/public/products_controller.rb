class Public::ProductsController < ApplicationController
  
  def index
    @products = Product.all
    @genres = Genre.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :detail, :is_available, :image)
  end
  
end
