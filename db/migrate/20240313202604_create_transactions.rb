class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :card_number, null: false, limit: 16
      t.integer :value_in_cents, null: false
      t.date :card_expiration_date, null: false
      t.integer :cvv, null: false, limit: 4

      t.timestamps
    end
  end
end
