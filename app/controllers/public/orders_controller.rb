class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @orders = Order.all

  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :postage)
  end

end
