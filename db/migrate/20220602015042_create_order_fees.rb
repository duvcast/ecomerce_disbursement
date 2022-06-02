class CreateOrderFees < ActiveRecord::Migration[7.0]
  def change
    create_table :order_fees do |t|
      t.float :amount
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
