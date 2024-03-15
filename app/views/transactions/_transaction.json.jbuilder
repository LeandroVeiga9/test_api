json.extract! transaction, :id, :card_number, :value_in_cents, :card_expiration_date, :cvv, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
