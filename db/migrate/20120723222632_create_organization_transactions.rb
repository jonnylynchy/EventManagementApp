class CreateOrganizationTransactions < ActiveRecord::Migration
  def change
    create_table :organization_transactions do |t|
      t.integer :organization_id
      t.integer :organization_payment_detail_id
      t.decimal :amount
      t.integer :transaction_type_id

      t.timestamps
    end
    add_index :organization_transactions, :organization_id
    add_index :organization_transactions, :organization_payment_detail_id, :unique => true, :name => 'by_payment_detail'
  end
end
