class Public::HomesController < ApplicationController

  def top
    @products = Product.sort_by{ |item| item.create_at }.reverse.first(4)
    @genres = Genre.order("id DESC").limit(8)
    @genre = Genre.all
  end
end
