class Public::ProductsController < ApplicationController
# before_action :find_genre, only: [:index, :show, :genre_products]

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

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :detail, :is_available, :image)
  end
  
  # def find_genre
  #   @genres = Genre.all
  # end

end
