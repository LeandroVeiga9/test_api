json.transactions @transactions, partial: "transactions/transaction", as: :transaction

json.pagination do
  json.total_pages @transactions.total_pages
  json.current_page @transactions.current_page
  json.next_page @transactions.next_page
  json.prev_page @transactions.prev_page
end
