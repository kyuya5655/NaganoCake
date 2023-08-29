class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.string "postal_code", null: false
      t.string "address", null: false
      t.string "name", null: false
      t.integer "payment_metod", default: 0, null: false
      t.integer "total_payment", null: false
      t.integer "postage",null: false
      t.timestamps
    end
  end
end
