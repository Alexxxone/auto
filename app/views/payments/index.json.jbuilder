json.array!(@payments) do |payment|
  json.extract! payment, :id, :customer_id, :user_id, :amount, :description
  json.url payment_url(payment, format: :json)
end
