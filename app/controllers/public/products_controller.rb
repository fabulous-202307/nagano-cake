class Public::ProductsController < ApplicationController
  
  def index
<<<<<<< HEAD
    @products = Product.page(params[:page])
    @genres = Genre.all
    @count_products = Product.count
    
=======
    @products = Product.all
    @genres = Genre.all
>>>>>>> adfef3dd4b505d1d856b68f2be81854ae138679c
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :detail, :is_available, :image)
  end
  
end
