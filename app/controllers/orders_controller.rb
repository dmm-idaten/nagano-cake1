class OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
	  @orders = Order.where(customer_id: current_customer.id)
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_customer.orders.new(order_params)
　　@order.save
　　@cart_items = current_user.cart_items.all
     @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_item.item.id
        @order_items.name = cart_item.item.name
        @order_items.price = cart_item.item.price
        @order_items.quantity = cart_item.quantity
        @order_items.save
        current_user.cart_items.destroy_all
     end
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

