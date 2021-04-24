class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

  def item_params
    params.require(:item).permit(:amount)
  end

end