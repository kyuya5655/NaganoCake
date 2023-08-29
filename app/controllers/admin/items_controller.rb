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
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:item_image, :name, :introduction, :price )
  end

end
