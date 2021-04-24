class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_postcode
      t.string :shipping_address
      t.string :shipping_name
      t.integer :postage
      t.integer :total_price
      t.string :payment, default: 0, null: false
      t.string :order_status, default: 0, null: false

      t.timestamps
    end
  end
end
