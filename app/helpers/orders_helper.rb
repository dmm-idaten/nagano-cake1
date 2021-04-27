module OrdersHelper

  def total_price(carts)
      total = 0
      carts.each do |cart|
        total = cart.subtotal + total
      end
      return total
  end

  def total_amount(orderorder_details)
      total = 0
      orderorder_details.each do |order_detail|
        total = order_detail.amount + total
      end
      return total
  end
end
