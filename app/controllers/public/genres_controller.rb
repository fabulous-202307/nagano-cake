class Public::GenresController < ApplicationController
  
  def genre_products
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @count_products = @genre.products.count
    @genre_paginate = @genre.products.page(params[:page]).per(8)
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end