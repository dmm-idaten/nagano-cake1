class CartsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @carts = current_customer.carts
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.save
    redirect_to carts_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end



    private

  # def current_cart
  #   # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
  #   current_cart = Cart.find_by(id: session[:cart_id])
  #   # Cart情報が存在しない場合、@current_cartを作成
  #   current_cart = Cart.create unless current_cart
  #   # 取得したCart情報よりIDを取得し、セッションに設定
  #   session[:cart_id] = current_cart.id
  #   # Cart情報を返却
  #   current_cart
  # end


  def cart_params
    params.require(:cart).permit(:amount, :customer_id, :item_id)
  end


end