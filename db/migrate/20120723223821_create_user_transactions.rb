class CreateUserTransactions < ActiveRecord::Migration
  def change
    create_table :user_transactions do |t|
      t.integer :user_id
      t.integer :user_payment_detail_id
      t.decimal :amount
      t.integer :transaction_type_id
      t.integer :event_id

      t.timestamps
    end
    add_index :user_transactions, :user_id
    add_index :user_transactions, :user_payment_detail_id
    add_index :user_transactions, :transaction_type_id
    add_index :user_transactions, :event_id
  end
end
