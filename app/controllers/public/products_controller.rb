class Public::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(8)
    @count_products = Product.count
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  def genre_products
    @products = Genre.find(params[:id]).products
    @genre = Genre.find(params[:id])
    @count_products = @genre.products.count
    @genres = Genre.all
    @genre_paginate = @genre.products.page(params[:page]).per(8)
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :detail, :is_available, :image)
  end

end