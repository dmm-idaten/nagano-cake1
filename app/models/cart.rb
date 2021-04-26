class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item


# 	def subtotal
# 		items.to_a.sum { |item| item.subtotal }
# 	end

  def subtotal
    self.amount * self.item.add_tax_price
  end


end
