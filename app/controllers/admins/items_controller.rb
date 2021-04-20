class Admins::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @new_item = Item.new
  end

  def create
  end

  def update
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image_id, :genre_id, :price, :is_active)
  end

end
