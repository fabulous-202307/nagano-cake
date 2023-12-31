class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genres = Genre.page(params[:page]).per(6)
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to request.referer
      flash[:notice] = "ジャンルを登録しました"
    else
      @genres = Genre.all
      render :index
      flash[:alert] = "ジャンルの登録に失敗しました"
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:notice] = "ジャンルを編集しました"
    else
      render :edit
      flash[alert] = "ジャンルの編集に失敗しました"
    end
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end