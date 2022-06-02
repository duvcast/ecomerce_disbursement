class CreateOrderFees < ActiveRecord::Migration[7.0]
  def change
    create_table :order_fees do |t|
      t.float :amount, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
