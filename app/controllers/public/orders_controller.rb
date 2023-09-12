class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    @cart_item = current_customer.cart_items.includes(:item)
    @order.postage = 800
    @order.total_payment = 0
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    @cart_items = current_customer.cart_items

    @cart_items.each do |cart_item|
      OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price, amount: cart_item.amount )
    end
    @cart_items.destroy_all
    render :completion
  end

  def completion
  end

  def show

  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :postage)
  end



end
