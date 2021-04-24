class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_deleted == "有効")
  end
  enum is_deleted: { '有効': false, '退会': true }

  has_many :carts
  has_many :addresses, dependent: :destroy
  has_many :orders

end
