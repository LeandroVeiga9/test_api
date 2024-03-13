class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :card_number
      t.integer :value_in_cents
      t.date :card_expiration_date
      t.integer :cvv

      t.timestamps
    end
  end
end
