class Address < ApplicationRecord

  belongs_to :customer

  def full_name
    "〒" + self.postal_code + "　" + self.address + "　" + self.name
  end

end
