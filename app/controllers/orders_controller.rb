class OrdersController < ApplicationController

  def index
    @orders = Order.all
    @order = Order.find(params[:id])
  end

  def show
	  
  end

  def new
	  
  end

  def create
	  
  end
	
  def confirm
	  
  end

  def completa
	    
  end
	
  private

  def order_params
	  params.require(:order).permit(:customer_id, :shipping_postcode, :shipping_address, :shipping_name, :postage, :total_price, :payment, :order_status)
  end
	
end

