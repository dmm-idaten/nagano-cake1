class CartsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @carts = current_customer.carts
  end

  def create
    @cart = Cart.new(cart_params)
    @item = @cart.item
    if @cart.save
    redirect_to carts_path
    else
      render template: "items/show"
    end
    
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to carts_path
  end

  def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy
		redirect_to carts_path
  end

  def destroy_all
		@carts = current_customer.carts
		@carts.destroy_all
		redirect_to carts_path
  end



    private

  def cart_params
    params.require(:cart).permit(:amount, :customer_id, :item_id)
  end


end