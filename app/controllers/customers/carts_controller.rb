class C:CartsController < ApplicationController
  
  def index
    # @cart_item = @cart.item
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end

  def destroy_all
  end
  

    private
    
  def current_cart
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    current_cart = Cart.find_by(id: session[:cart_id])
    # Cart情報が存在しない場合、@current_cartを作成
    current_cart = Cart.create unless current_cart
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:cart_id] = current_cart.id
    # Cart情報を返却
    current_cart
  end
    
    
  def cart_params
    params.require(:cart).permit(:amount)
  end
  
end