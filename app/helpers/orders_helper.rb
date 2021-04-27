module OrdersHelper
    def total_price(carts)
        total = 0
        carts.each do |cart|
          total = cart.subtotal + total
        end
    return total
　  end
end
