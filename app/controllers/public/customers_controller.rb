class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  private
  def list_params
    params.require(:list).permit(:last_name, :first_name, :last_name_kane, :first_name_kana, :email, :post_code, :address, :phone_number,)
  end
end
