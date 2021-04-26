class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
	  @orders = Order.where(customer_id: current_customer.id)
    @order_details = @orders.order_details
  end

  def new
    @order = Order.where(customer_id: current_customer.id)
  end

  def confirm
    @carts = current_customer.carts
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.shipping_postcode = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @order_address = Address.find(params[:order][:address_id])
      @order.shipping_postcode = @order_address.postal_code
      @order.shipping_address = @order_address.address
      @order.shipping_name = @order_address.name
    elsif params[:order][:address_option] == "2"
      @order.shipping_postcode = params[:order][:shipping_postcode]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @carts =  current_customer.carts
    @carts.each do |detail|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = detail.item_id
      order_detail.price = @order.total_price
      order_detail.amount = detail.amount
      order_detail.save
    end
    current_customer.carts.destroy_all
    redirect_to orders_complete_path
  end

  def complete

  end

  private

  def order_params
    params.require(:order).permit(:payment, :shipping_postcode, :shipping_address, :shipping_name, :total_price, :postage)
  end

end

