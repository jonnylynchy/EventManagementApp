class CreateOrganizationPaymentGateways < ActiveRecord::Migration
  def change
    create_table :organization_payment_gateways do |t|
      t.integer :organization_id
      t.integer :payment_gateway_type_id
      t.boolean :is_test_mode
      t.boolean :is_active
      t.string :login
      t.string :user
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
    add_index :organization_payment_gateways, :organization_id
    add_index :organization_payment_gateways, :payment_gateway_type_id
  end
end
