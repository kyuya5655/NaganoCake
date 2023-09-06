class Public::CartItemsController < ApplicationController

  # def create
  #   # @item = Item.find(cart_item_params[:item_id])
  #   @cart_item = CartItem.new(cart_item_params)
  #   @cart_item.customer_id = current_customer.id
  #   @cart_item.save
  #   redirect_to cart_items_path
  # end

  def create
    @cart_item = CartItem.find_by(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = CartItem.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          new_amount = cart_item.amount += @cart_item.amount.to_i
          cart_item.update(:cart_item)
        # else
        #   @cart_item.save

        end
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
