class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @new_item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admins_item_path(@item)
    else
      flash[:notice] = "新商品の登録に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end


  def update
    @item = Item.find(params[:id])
     if @item.update(item_params)
       flash[:notice] = "商品を更新しました"
       redirect_to admins_item_path(@item)
     else
       flash[:notice] = "商品の更新に失敗しました"
       redirect_back(fallback_location: root_path)
     end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :genre_id, :price, :is_active)
  end
  
end
