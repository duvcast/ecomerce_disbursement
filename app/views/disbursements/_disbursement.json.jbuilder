json.extract! disbursement, :id, :amount, :order_id, :created_at, :updated_at
json.url disbursement_url(disbursement, format: :json)
