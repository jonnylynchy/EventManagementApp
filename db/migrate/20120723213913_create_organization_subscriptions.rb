class CreateOrganizationSubscriptions < ActiveRecord::Migration
  def change
    create_table :organization_subscriptions do |t|
      t.integer :organization_id
      t.integer :subscription_type_id
      t.date :start_date
      t.date :end_date
      t.boolean :is_auto_renew

      t.timestamps
    end
    add_index :organization_subscriptions, :organization_id
    add_index :organization_subscriptions, :subscription_type_id
  end
end
