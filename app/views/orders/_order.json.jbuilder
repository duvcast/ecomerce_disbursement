json.extract! order, :id, :amount, :completed_at, :merchant_id, :shopper_id, :created_at, :updated_at
json.url order_url(order, format: :json)
