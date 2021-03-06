class Item < ApplicationRecord

  has_many :carts
  has_many :order_details

  belongs_to :genre

  attachment :image

  def add_tax_price
    (self.price * 1.10).round
  end
  
  # def subtotal
  #   amount * price 
  # end
  

  # enum genre_id: {'ケーキ':1, 'プリン':2, '焼き菓子':3, 'キャンディ':4}

  enum is_active: {'販売中':true,  '販売停止中':false}

  validates :name, :price, presence: true
	validates :introduction, length: {maximum: 200}

end
