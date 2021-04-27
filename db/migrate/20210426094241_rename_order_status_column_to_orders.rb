class RenameOrderStatusColumnToOrders < ActiveRecord::Migration[5.2]

  def up
    change_column :orders, :order_status, :integer, null: false
  end

  def down
    change_column :orders, :order_status, :string, default: "0", null: false
  end

end
