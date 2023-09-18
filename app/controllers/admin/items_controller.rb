class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    redirect_to admin_item_path(@item.id)
  end

  def index
    @items = Item.page(params[:page])
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
