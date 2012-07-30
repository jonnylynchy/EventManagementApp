class RemoveIndexFromOrganizationTransactions < ActiveRecord::Migration
  def up
    remove_index :organization_transactions, name: "by_payment_detail"
  end

  def down
    add_index :organization_transactions, :organization_payment_detail_id, name: 'by_payment_detail'
  end
end
