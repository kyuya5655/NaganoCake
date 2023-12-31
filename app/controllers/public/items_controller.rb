class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def items_params
    params.require(:item).permit(:item_image, :name, :introduction, :price )
  end

end
