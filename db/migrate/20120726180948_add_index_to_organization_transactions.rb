class AddIndexToOrganizationTransactions < ActiveRecord::Migration
  def change
    add_index :organization_transactions, :organization_payment_detail_id, name: 'by_payment_detail'
  end
end
