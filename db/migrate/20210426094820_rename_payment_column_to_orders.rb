class RenamePaymentColumnToOrders < ActiveRecord::Migration[5.2]

  def up
    change_column :orders, :payment, :integer, null: false
  end

  def down
    change_column :orders, :payment, :string, null: false
  end

end
