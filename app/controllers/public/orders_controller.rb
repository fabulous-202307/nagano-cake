class Public::OrdersController < ApplicationController
  
  def new
    @order = current_customer.orders.new
  end 
  
  def create
  end 
  
  def index
  end 
  
  def show
  end 
  
end
