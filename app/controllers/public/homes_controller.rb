class Public::HomesController < ApplicationController

  def top
    @products = Product.order("id DESC").limit(4)
    @genres = Genre.order("id DESC").limit(8)
    @genre = Genre.all
  end
end