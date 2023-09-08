class Public::CartItemsController < ApplicationController

  def create
    @cart_item_new = CartItem.new(cart_item_params)
    @cart_item_new.customer_id = current_customer.id
    @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
      if @cart_item
        @cart_total_amount = @cart_item.amount += @cart_item_new.amount.to_i
        @cart_item.update(amount: @cart_total_amount)
        redirect_to cart_items_path
      else
        @item = Item.find(cart_item_params[:item_id])
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        @cart_item.save
        redirect_to cart_items_path
      end
  end

  def index
    @cart_items = CartItem.all
    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
