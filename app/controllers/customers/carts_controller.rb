class Customers::CartsController < ApplicationController
  
  def index
    @cart_item = @cart.item
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
  def cart_params
    params.require(:cart).permit(:amount)
  end
  
end