class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:mypage, :edit, :update, :withdraw]

  def mypage
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
   if current_customer.update(customer_params)
     redirect_to mypage_path
   else
     redirect_to infomation_path
   end
  end

  def confirm_withdraw
  end

  def withdraw
    current_customer.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end



  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
  end

  def set_customer
    @customer = Customer.find_by(params[:email])
  end

end
