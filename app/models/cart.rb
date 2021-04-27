class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def add_tax_price
    (self.price * 1.10).round
  end

  def subtotal
    self.amount * self.item.add_tax_price
  end

  validates :amount, presence: true

end
