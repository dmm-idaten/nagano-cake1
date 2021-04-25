class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
	  @orders = Order.where(customer_id: current_customer.id)
  end

  def new
    @orders = Order.where(customer_id: current_customer.id)
  end

  def confirm

  end
  
  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @carts = current_customer.carts.all
     @carts.each do |cart|
        @order_items = @order.order_items.new
        @order_items.item_id = cart.item.id
        @order_items.name = cart.item.name
        @order_items.price = cart.item.price
        @order_items.amount = cart.item.amount
        @order_items.save
        # current_customer.carts.destroy_all
     end
  end

  

  def completa

  end

  private

  def order_params
	  params.require(:order).permit(:order, :customer_id, :shipping_postcode, :shipping_address, :shipping_name, :postage, :total_price, :payment, :order_status)
  end

end

