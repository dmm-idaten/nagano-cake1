class Item < ApplicationRecord

  # belongs_to :cart
  has_many :genres

  attachment :image
  
  def add_tax_price
    (self.price * 1.10).round
  end

  # enum genre_id: {'ケーキ':1, 'プリン':2, '焼き菓子':3, 'キャンディ':4}

  enum is_active: {'販売中':true,  '販売停止中':false}

  validates :name, :price, presence: true
	validates :introduction, length: {maximum: 200}

end
