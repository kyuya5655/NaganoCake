class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.save
    render :show
  end

  def index
    @items = Item.all
    @item = Item.new
    @item_image = @item.image
  end

  def show

  end

  private

  def items_params
    params.require(:item).permit(:item_image, :name, :introduction, :price )
  end

end
